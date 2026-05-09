; DESCRIPTION: Renders a blue line between points (439, 243) and (212, 164).
; PLAN: r0=439(x1), r1=243(y1), r2=212(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 243
LDI r2, 212
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
