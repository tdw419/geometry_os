; DESCRIPTION: Composite: Places a blue line segment connecting (7, 227) to (157, 162) then Draws a yellow rectangle at (50, 144) with width 119 and height 98 then Sets a single green pixel at (195, 210).
; PLAN: r0=7(x1), r1=227(y1), r2=157(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=50(x), r6=144(y), r7=119(width), r8=98(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=195(x), r11=210(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 7
LDI r1, 227
LDI r2, 157
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 144
LDI r7, 119
LDI r8, 98
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 195
LDI r11, 210
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
