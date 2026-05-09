; DESCRIPTION: Composite: Draws a blue line from (259, 77) to (69, 209) then Places a green 118x59 rectangle at position (87, 122) then Places a magenta circle of radius 25 at center (334, 45).
; PLAN: r0=259(x1), r1=77(y1), r2=69(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=87(x), r6=122(y), r7=118(width), r8=59(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=334(x), r11=45(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 259
LDI r1, 77
LDI r2, 69
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 122
LDI r7, 118
LDI r8, 59
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 45
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
