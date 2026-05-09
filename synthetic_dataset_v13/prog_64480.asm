; DESCRIPTION: Renders a purple line between points (368, 111) and (482, 162).
; PLAN: r0=368(x1), r1=111(y1), r2=482(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 111
LDI r2, 482
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
