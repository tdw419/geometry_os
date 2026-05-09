; DESCRIPTION: Composite: Places a green circle of radius 70 at center (316, 108) then Draws a blue line from (110, 171) to (250, 141).
; PLAN: r0=316(x), r1=108(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x1), r6=171(y1), r7=250(x2), r8=141(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 108
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 171
LDI r7, 250
LDI r8, 141
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
