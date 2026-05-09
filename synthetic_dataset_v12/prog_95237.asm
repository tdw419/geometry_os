; DESCRIPTION: Renders a blue line between points (482, 229) and (341, 13).
; PLAN: r0=482(x1), r1=229(y1), r2=341(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 229
LDI r2, 341
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
