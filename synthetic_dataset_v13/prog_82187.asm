; DESCRIPTION: Renders a blue line between points (23, 60) and (86, 160).
; PLAN: r0=23(x1), r1=60(y1), r2=86(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 60
LDI r2, 86
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
