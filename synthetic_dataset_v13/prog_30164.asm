; DESCRIPTION: Renders a magenta line between points (366, 53) and (99, 235).
; PLAN: r0=366(x1), r1=53(y1), r2=99(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 53
LDI r2, 99
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
