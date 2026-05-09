; DESCRIPTION: Renders a magenta line between points (115, 229) and (235, 149).
; PLAN: r0=115(x1), r1=229(y1), r2=235(x2), r3=149(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 229
LDI r2, 235
LDI r3, 149
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
