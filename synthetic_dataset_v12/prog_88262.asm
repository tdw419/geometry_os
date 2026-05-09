; DESCRIPTION: Renders a purple line between points (495, 214) and (353, 178).
; PLAN: r0=495(x1), r1=214(y1), r2=353(x2), r3=178(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 214
LDI r2, 353
LDI r3, 178
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
