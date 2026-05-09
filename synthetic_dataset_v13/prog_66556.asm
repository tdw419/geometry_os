; DESCRIPTION: Renders a green line between points (279, 78) and (117, 194).
; PLAN: r0=279(x1), r1=78(y1), r2=117(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 78
LDI r2, 117
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
