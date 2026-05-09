; DESCRIPTION: Renders a blue line between points (262, 93) and (273, 225).
; PLAN: r0=262(x1), r1=93(y1), r2=273(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 93
LDI r2, 273
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
