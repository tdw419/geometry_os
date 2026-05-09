; DESCRIPTION: Composite: Renders a green box of size 74x16 starting at (51, 188) then Draws a yellow line from (419, 88) to (190, 58) then Places a purple circle of radius 32 at center (399, 91).
; PLAN: r0=51(x), r1=188(y), r2=74(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x1), r6=88(y1), r7=190(x2), r8=58(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=399(x), r11=91(y), r12=32(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 51
LDI r1, 188
LDI r2, 74
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 88
LDI r7, 190
LDI r8, 58
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 399
LDI r11, 91
LDI r12, 32
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
