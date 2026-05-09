; DESCRIPTION: Renders a blue line between points (235, 7) and (126, 229).
; PLAN: r0=235(x1), r1=7(y1), r2=126(x2), r3=229(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 7
LDI r2, 126
LDI r3, 229
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
