; DESCRIPTION: Renders a blue line between points (330, 149) and (337, 32).
; PLAN: r0=330(x1), r1=149(y1), r2=337(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 149
LDI r2, 337
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
