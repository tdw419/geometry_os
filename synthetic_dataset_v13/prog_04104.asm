; DESCRIPTION: Places a black line segment connecting (383, 45) to (115, 182).
; PLAN: r0=383(x1), r1=45(y1), r2=115(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 45
LDI r2, 115
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
