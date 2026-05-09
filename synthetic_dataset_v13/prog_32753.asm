; DESCRIPTION: Renders a green line between points (47, 96) and (423, 10).
; PLAN: r0=47(x1), r1=96(y1), r2=423(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 96
LDI r2, 423
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
