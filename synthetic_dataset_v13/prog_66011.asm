; DESCRIPTION: Places a black line segment connecting (252, 67) to (214, 12).
; PLAN: r0=252(x1), r1=67(y1), r2=214(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 67
LDI r2, 214
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
