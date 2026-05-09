; DESCRIPTION: Renders a blue line between points (65, 131) and (373, 231).
; PLAN: r0=65(x1), r1=131(y1), r2=373(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 131
LDI r2, 373
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
