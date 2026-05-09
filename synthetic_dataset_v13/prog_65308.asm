; DESCRIPTION: Places a black line segment connecting (497, 48) to (401, 173).
; PLAN: r0=497(x1), r1=48(y1), r2=401(x2), r3=173(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 48
LDI r2, 401
LDI r3, 173
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
