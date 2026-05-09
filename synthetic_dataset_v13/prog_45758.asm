; DESCRIPTION: Renders a green line between points (78, 6) and (376, 5).
; PLAN: r0=78(x1), r1=6(y1), r2=376(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 6
LDI r2, 376
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
