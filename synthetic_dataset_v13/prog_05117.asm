; DESCRIPTION: Renders a blue line between points (337, 215) and (330, 100).
; PLAN: r0=337(x1), r1=215(y1), r2=330(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 215
LDI r2, 330
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
