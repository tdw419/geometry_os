; DESCRIPTION: Places a purple line segment connecting (403, 152) to (485, 88).
; PLAN: r0=403(x1), r1=152(y1), r2=485(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 152
LDI r2, 485
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
