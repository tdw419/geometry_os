; DESCRIPTION: Draws a black line from (355, 248) to (235, 106).
; PLAN: r0=355(x1), r1=248(y1), r2=235(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 248
LDI r2, 235
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
