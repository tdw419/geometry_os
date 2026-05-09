; DESCRIPTION: Renders a white line between points (235, 191) and (132, 128).
; PLAN: r0=235(x1), r1=191(y1), r2=132(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 191
LDI r2, 132
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
