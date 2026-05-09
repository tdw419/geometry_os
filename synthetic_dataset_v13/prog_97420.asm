; DESCRIPTION: Composite: Sets a single yellow pixel at (186, 4) then Renders a yellow disk with center (219, 190) and radius 57 then Places a yellow 118x100 rectangle at position (284, 18).
; PLAN: r0=186(x), r1=4(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=219(x), r6=190(y), r7=57(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=18(y), r12=118(width), r13=100(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 4
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 219
LDI r6, 190
LDI r7, 57
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 18
LDI r12, 118
LDI r13, 100
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
