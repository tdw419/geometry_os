; DESCRIPTION: Renders a green line between points (22, 56) and (50, 114).
; PLAN: r0=22(x1), r1=56(y1), r2=50(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 56
LDI r2, 50
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
