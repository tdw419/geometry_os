; DESCRIPTION: Renders a magenta line between points (63, 235) and (1, 208).
; PLAN: r0=63(x1), r1=235(y1), r2=1(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 235
LDI r2, 1
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
