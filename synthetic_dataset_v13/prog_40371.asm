; DESCRIPTION: Places a blue line segment connecting (125, 239) to (336, 217).
; PLAN: r0=125(x1), r1=239(y1), r2=336(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 239
LDI r2, 336
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
