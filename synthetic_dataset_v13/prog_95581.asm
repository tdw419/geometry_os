; DESCRIPTION: Draws a black line from (235, 109) to (418, 200).
; PLAN: r0=235(x1), r1=109(y1), r2=418(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 109
LDI r2, 418
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
