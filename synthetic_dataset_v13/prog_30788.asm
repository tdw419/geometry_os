; DESCRIPTION: Renders a black line between points (276, 248) and (235, 60).
; PLAN: r0=276(x1), r1=248(y1), r2=235(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 248
LDI r2, 235
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
