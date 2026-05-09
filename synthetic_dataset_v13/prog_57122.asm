; DESCRIPTION: Renders a purple line between points (0, 135) and (241, 166).
; PLAN: r0=0(x1), r1=135(y1), r2=241(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 135
LDI r2, 241
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
