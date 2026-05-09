; DESCRIPTION: Draws a blue line from (395, 130) to (426, 236).
; PLAN: r0=395(x1), r1=130(y1), r2=426(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 130
LDI r2, 426
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
