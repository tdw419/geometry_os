; DESCRIPTION: Composite: Draws a blue line from (38, 254) to (222, 114) then Draws a purple circle centered at (78, 61) with radius 39.
; PLAN: r0=38(x1), r1=254(y1), r2=222(x2), r3=114(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=78(x), r6=61(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 254
LDI r2, 222
LDI r3, 114
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 61
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
