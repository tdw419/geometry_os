; DESCRIPTION: Renders a purple line between points (405, 167) and (72, 20).
; PLAN: r0=405(x1), r1=167(y1), r2=72(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 167
LDI r2, 72
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
