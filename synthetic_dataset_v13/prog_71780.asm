; DESCRIPTION: Renders a blue line between points (128, 133) and (461, 128).
; PLAN: r0=128(x1), r1=133(y1), r2=461(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 133
LDI r2, 461
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
