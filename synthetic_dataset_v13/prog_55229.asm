; DESCRIPTION: Composite: Sets a single purple pixel at (65, 188) then Renders a yellow disk with center (342, 63) and radius 15 then Places a blue 38x60 rectangle at position (73, 169).
; PLAN: r0=65(x), r1=188(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=63(y), r7=15(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x), r11=169(y), r12=38(width), r13=60(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 188
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 342
LDI r6, 63
LDI r7, 15
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 169
LDI r12, 38
LDI r13, 60
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
