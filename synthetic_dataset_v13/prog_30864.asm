; DESCRIPTION: Renders a magenta line between points (27, 60) and (181, 72).
; PLAN: r0=27(x1), r1=60(y1), r2=181(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 60
LDI r2, 181
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
