; DESCRIPTION: Places a black line segment connecting (248, 239) to (14, 216).
; PLAN: r0=248(x1), r1=239(y1), r2=14(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 239
LDI r2, 14
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
