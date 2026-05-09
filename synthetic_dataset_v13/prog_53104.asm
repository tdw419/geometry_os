; DESCRIPTION: Renders a green line between points (285, 34) and (97, 196).
; PLAN: r0=285(x1), r1=34(y1), r2=97(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 34
LDI r2, 97
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
