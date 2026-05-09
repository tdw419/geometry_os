; DESCRIPTION: Renders a green line between points (413, 181) and (110, 10).
; PLAN: r0=413(x1), r1=181(y1), r2=110(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 181
LDI r2, 110
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
