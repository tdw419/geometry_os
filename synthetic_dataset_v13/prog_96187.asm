; DESCRIPTION: Draws a purple line from (120, 225) to (482, 173).
; PLAN: r0=120(x1), r1=225(y1), r2=482(x2), r3=173(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 225
LDI r2, 482
LDI r3, 173
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
