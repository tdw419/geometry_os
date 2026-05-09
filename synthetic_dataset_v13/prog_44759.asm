; DESCRIPTION: Renders a purple line between points (136, 27) and (465, 19).
; PLAN: r0=136(x1), r1=27(y1), r2=465(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 27
LDI r2, 465
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
