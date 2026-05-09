; DESCRIPTION: Composite: Renders a purple line between points (361, 123) and (386, 5) then Places a yellow dot at position (231, 2) then Draws a blue rectangle at (3, 1) with width 84 and height 31.
; PLAN: r0=361(x1), r1=123(y1), r2=386(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=2(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=3(x), r11=1(y), r12=84(width), r13=31(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 361
LDI r1, 123
LDI r2, 386
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 2
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 3
LDI r11, 1
LDI r12, 84
LDI r13, 31
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
