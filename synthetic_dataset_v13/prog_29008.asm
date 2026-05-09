; DESCRIPTION: Places a blue line segment connecting (352, 73) to (338, 239).
; PLAN: r0=352(x1), r1=73(y1), r2=338(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 73
LDI r2, 338
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
