; DESCRIPTION: Renders a green line between points (6, 114) and (454, 35).
; PLAN: r0=6(x1), r1=114(y1), r2=454(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 114
LDI r2, 454
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
