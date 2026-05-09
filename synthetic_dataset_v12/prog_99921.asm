; DESCRIPTION: Renders a purple line between points (215, 220) and (7, 58).
; PLAN: r0=215(x1), r1=220(y1), r2=7(x2), r3=58(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 220
LDI r2, 7
LDI r3, 58
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
