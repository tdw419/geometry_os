; DESCRIPTION: Renders a magenta line between points (149, 70) and (368, 237).
; PLAN: r0=149(x1), r1=70(y1), r2=368(x2), r3=237(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 70
LDI r2, 368
LDI r3, 237
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
