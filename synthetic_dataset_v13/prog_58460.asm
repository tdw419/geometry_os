; DESCRIPTION: Composite: Renders a blue box of size 83x20 starting at (54, 188) then Draws a black line from (197, 168) to (206, 132) then Renders a black disk with center (191, 157) and radius 40.
; PLAN: r0=54(x), r1=188(y), r2=83(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x1), r6=168(y1), r7=206(x2), r8=132(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=191(x), r11=157(y), r12=40(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 54
LDI r1, 188
LDI r2, 83
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 168
LDI r7, 206
LDI r8, 132
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 157
LDI r12, 40
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
