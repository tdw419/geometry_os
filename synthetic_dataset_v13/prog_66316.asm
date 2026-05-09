; DESCRIPTION: Renders a purple line between points (486, 226) and (21, 128).
; PLAN: r0=486(x1), r1=226(y1), r2=21(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 226
LDI r2, 21
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
