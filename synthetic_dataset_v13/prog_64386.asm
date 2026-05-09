; DESCRIPTION: Places a blue line segment connecting (11, 248) to (239, 38).
; PLAN: r0=11(x1), r1=248(y1), r2=239(x2), r3=38(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 248
LDI r2, 239
LDI r3, 38
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
