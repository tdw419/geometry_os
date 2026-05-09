; DESCRIPTION: Draws a blue line from (413, 90) to (353, 237).
; PLAN: r0=413(x1), r1=90(y1), r2=353(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 90
LDI r2, 353
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
