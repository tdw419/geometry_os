; DESCRIPTION: Renders a purple line between points (173, 12) and (2, 68).
; PLAN: r0=173(x1), r1=12(y1), r2=2(x2), r3=68(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 12
LDI r2, 2
LDI r3, 68
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
