; DESCRIPTION: Composite: Renders a magenta line between points (98, 16) and (309, 96) then Places a magenta circle of radius 19 at center (226, 147) then Renders a white box of size 90x19 starting at (314, 211).
; PLAN: r0=98(x1), r1=16(y1), r2=309(x2), r3=96(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=147(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=314(x), r11=211(y), r12=90(width), r13=19(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 16
LDI r2, 309
LDI r3, 96
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 147
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 314
LDI r11, 211
LDI r12, 90
LDI r13, 19
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
