; DESCRIPTION: Draws a black line from (106, 140) to (340, 201).
; PLAN: r0=106(x1), r1=140(y1), r2=340(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 140
LDI r2, 340
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
