; DESCRIPTION: Renders a blue line between points (332, 152) and (349, 252).
; PLAN: r0=332(x1), r1=152(y1), r2=349(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 152
LDI r2, 349
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
