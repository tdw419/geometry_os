; DESCRIPTION: Renders a blue line between points (80, 229) and (42, 226).
; PLAN: r0=80(x1), r1=229(y1), r2=42(x2), r3=226(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 229
LDI r2, 42
LDI r3, 226
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
