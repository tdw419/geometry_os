; DESCRIPTION: Places a black line segment connecting (239, 214) to (417, 123).
; PLAN: r0=239(x1), r1=214(y1), r2=417(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 214
LDI r2, 417
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
