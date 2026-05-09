; DESCRIPTION: Places a black line segment connecting (161, 218) to (3, 210).
; PLAN: r0=161(x1), r1=218(y1), r2=3(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 218
LDI r2, 3
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
