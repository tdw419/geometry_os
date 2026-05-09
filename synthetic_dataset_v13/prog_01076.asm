; DESCRIPTION: Draws a blue line from (349, 130) to (78, 192).
; PLAN: r0=349(x1), r1=130(y1), r2=78(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 130
LDI r2, 78
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
