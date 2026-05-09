; DESCRIPTION: Renders a magenta line between points (210, 235) and (181, 35).
; PLAN: r0=210(x1), r1=235(y1), r2=181(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 235
LDI r2, 181
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
