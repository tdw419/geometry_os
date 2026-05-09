; DESCRIPTION: Renders a purple line between points (259, 44) and (399, 196).
; PLAN: r0=259(x1), r1=44(y1), r2=399(x2), r3=196(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 44
LDI r2, 399
LDI r3, 196
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
