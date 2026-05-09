; DESCRIPTION: Renders a purple line between points (273, 194) and (485, 16).
; PLAN: r0=273(x1), r1=194(y1), r2=485(x2), r3=16(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 194
LDI r2, 485
LDI r3, 16
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
