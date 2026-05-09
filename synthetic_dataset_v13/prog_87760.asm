; DESCRIPTION: Renders a purple line between points (36, 36) and (465, 6).
; PLAN: r0=36(x1), r1=36(y1), r2=465(x2), r3=6(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 36
LDI r2, 465
LDI r3, 6
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
