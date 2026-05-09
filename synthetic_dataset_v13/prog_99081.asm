; DESCRIPTION: Composite: Draws a blue line from (44, 60) to (220, 229) then Sets a single black pixel at (278, 22).
; PLAN: r0=44(x1), r1=60(y1), r2=220(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=278(x), r6=22(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 44
LDI r1, 60
LDI r2, 220
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 278
LDI r6, 22
LDI r7, 0x000000
PSET r5, r6, r7
HALT
