; DESCRIPTION: Places a black line segment connecting (482, 27) to (423, 205).
; PLAN: r0=482(x1), r1=27(y1), r2=423(x2), r3=205(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 27
LDI r2, 423
LDI r3, 205
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
