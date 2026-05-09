; DESCRIPTION: Composite: Places a blue line segment connecting (320, 81) to (238, 153) then Places a yellow dot at position (446, 106) then Draws a red circle centered at (328, 187) with radius 19.
; PLAN: r0=320(x1), r1=81(y1), r2=238(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=106(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=328(x), r11=187(y), r12=19(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 320
LDI r1, 81
LDI r2, 238
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 106
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 328
LDI r11, 187
LDI r12, 19
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
