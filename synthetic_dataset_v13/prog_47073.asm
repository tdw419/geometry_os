; DESCRIPTION: Renders a green line between points (78, 119) and (23, 71).
; PLAN: r0=78(x1), r1=119(y1), r2=23(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 119
LDI r2, 23
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
