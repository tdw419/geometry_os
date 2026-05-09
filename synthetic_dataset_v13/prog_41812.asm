; DESCRIPTION: Composite: Renders a purple line between points (461, 241) and (440, 35) then Creates a black rectangular region at (302, 97) spanning 71 by 111 pixels.
; PLAN: r0=461(x1), r1=241(y1), r2=440(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=97(y), r7=71(width), r8=111(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 241
LDI r2, 440
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 97
LDI r7, 71
LDI r8, 111
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
