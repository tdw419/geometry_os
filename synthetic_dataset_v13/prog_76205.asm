; DESCRIPTION: Composite: Sets a single yellow pixel at (510, 20) then Creates a yellow circular shape at (307, 78) with radius 19 then Places a blue 38x19 rectangle at position (120, 65).
; PLAN: r0=510(x), r1=20(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=78(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=120(x), r11=65(y), r12=38(width), r13=19(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 510
LDI r1, 20
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 307
LDI r6, 78
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 120
LDI r11, 65
LDI r12, 38
LDI r13, 19
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
