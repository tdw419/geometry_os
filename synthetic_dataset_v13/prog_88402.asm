; DESCRIPTION: Renders a magenta line between points (72, 234) and (363, 133).
; PLAN: r0=72(x1), r1=234(y1), r2=363(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 234
LDI r2, 363
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
