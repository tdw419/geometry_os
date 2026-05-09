; DESCRIPTION: Composite: Draws a blue line from (260, 143) to (386, 231) then Draws a orange circle centered at (414, 155) with radius 14.
; PLAN: r0=260(x1), r1=143(y1), r2=386(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=155(y), r7=14(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 260
LDI r1, 143
LDI r2, 386
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 155
LDI r7, 14
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
