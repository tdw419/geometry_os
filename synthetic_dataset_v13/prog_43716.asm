; DESCRIPTION: Renders a purple line between points (172, 67) and (450, 14).
; PLAN: r0=172(x1), r1=67(y1), r2=450(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 67
LDI r2, 450
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
