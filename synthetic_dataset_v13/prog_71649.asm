; DESCRIPTION: Renders a purple line between points (398, 88) and (16, 7).
; PLAN: r0=398(x1), r1=88(y1), r2=16(x2), r3=7(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 88
LDI r2, 16
LDI r3, 7
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
