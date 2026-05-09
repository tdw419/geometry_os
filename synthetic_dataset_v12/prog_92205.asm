; DESCRIPTION: Renders a blue line between points (235, 201) and (275, 150).
; PLAN: r0=235(x1), r1=201(y1), r2=275(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 201
LDI r2, 275
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
