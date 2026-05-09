; DESCRIPTION: Places a blue line segment connecting (403, 207) to (485, 252).
; PLAN: r0=403(x1), r1=207(y1), r2=485(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 207
LDI r2, 485
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
