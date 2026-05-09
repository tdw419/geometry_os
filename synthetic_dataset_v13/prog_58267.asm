; DESCRIPTION: Renders a blue line between points (444, 93) and (292, 243).
; PLAN: r0=444(x1), r1=93(y1), r2=292(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 93
LDI r2, 292
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
