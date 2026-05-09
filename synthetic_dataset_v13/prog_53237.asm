; DESCRIPTION: Places a black line segment connecting (314, 205) to (214, 206).
; PLAN: r0=314(x1), r1=205(y1), r2=214(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 205
LDI r2, 214
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
