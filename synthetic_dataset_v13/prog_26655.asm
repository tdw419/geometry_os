; DESCRIPTION: Draws a blue line from (239, 108) to (453, 24).
; PLAN: r0=239(x1), r1=108(y1), r2=453(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 108
LDI r2, 453
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
