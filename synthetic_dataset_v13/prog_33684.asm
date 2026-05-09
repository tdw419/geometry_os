; DESCRIPTION: Renders a purple line between points (67, 231) and (453, 207).
; PLAN: r0=67(x1), r1=231(y1), r2=453(x2), r3=207(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 231
LDI r2, 453
LDI r3, 207
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
