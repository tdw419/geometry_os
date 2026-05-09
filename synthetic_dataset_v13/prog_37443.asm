; DESCRIPTION: Renders a purple line between points (39, 36) and (365, 209).
; PLAN: r0=39(x1), r1=36(y1), r2=365(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 36
LDI r2, 365
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
