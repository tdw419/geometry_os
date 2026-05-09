; DESCRIPTION: Renders a blue line between points (425, 21) and (6, 45).
; PLAN: r0=425(x1), r1=21(y1), r2=6(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 21
LDI r2, 6
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
