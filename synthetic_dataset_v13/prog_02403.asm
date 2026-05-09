; DESCRIPTION: Places a black line segment connecting (23, 52) to (215, 23).
; PLAN: r0=23(x1), r1=52(y1), r2=215(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 52
LDI r2, 215
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
