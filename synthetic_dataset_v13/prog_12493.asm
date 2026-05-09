; DESCRIPTION: Renders a magenta line between points (236, 231) and (78, 250).
; PLAN: r0=236(x1), r1=231(y1), r2=78(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 231
LDI r2, 78
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
