; DESCRIPTION: Places a yellow line segment connecting (7, 67) to (401, 7).
; PLAN: r0=7(x1), r1=67(y1), r2=401(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 67
LDI r2, 401
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
