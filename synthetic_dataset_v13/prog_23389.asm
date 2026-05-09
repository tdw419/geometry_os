; DESCRIPTION: Places a blue line segment connecting (352, 214) to (440, 81).
; PLAN: r0=352(x1), r1=214(y1), r2=440(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 214
LDI r2, 440
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
