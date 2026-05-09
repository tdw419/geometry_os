; DESCRIPTION: Renders a purple line between points (242, 74) and (421, 25).
; PLAN: r0=242(x1), r1=74(y1), r2=421(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 74
LDI r2, 421
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
