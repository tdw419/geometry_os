; DESCRIPTION: Composite: Draws a blue line from (355, 94) to (98, 80) then Creates a black rectangular region at (211, 108) spanning 94 by 51 pixels.
; PLAN: r0=355(x1), r1=94(y1), r2=98(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=211(x), r6=108(y), r7=94(width), r8=51(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 94
LDI r2, 98
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 211
LDI r6, 108
LDI r7, 94
LDI r8, 51
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
