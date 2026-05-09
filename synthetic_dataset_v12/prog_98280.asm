; DESCRIPTION: Renders a purple line between points (110, 168) and (167, 48).
; PLAN: r0=110(x1), r1=168(y1), r2=167(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 168
LDI r2, 167
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
