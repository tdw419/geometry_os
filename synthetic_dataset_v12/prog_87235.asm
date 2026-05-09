; DESCRIPTION: Renders a magenta line between points (182, 235) and (366, 212).
; PLAN: r0=182(x1), r1=235(y1), r2=366(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 235
LDI r2, 366
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
