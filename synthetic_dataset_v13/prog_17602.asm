; DESCRIPTION: Renders a red line between points (62, 48) and (78, 87).
; PLAN: r0=62(x1), r1=48(y1), r2=78(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 48
LDI r2, 78
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
