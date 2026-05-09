; DESCRIPTION: Composite: Draws a magenta line from (264, 101) to (448, 222) then Places a blue 117x28 rectangle at position (338, 132) then Draws a magenta circle centered at (363, 220) with radius 25.
; PLAN: r0=264(x1), r1=101(y1), r2=448(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=338(x), r6=132(y), r7=117(width), r8=28(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=363(x), r11=220(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 264
LDI r1, 101
LDI r2, 448
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 132
LDI r7, 117
LDI r8, 28
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 220
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
