; DESCRIPTION: Places a yellow line segment connecting (430, 244) to (477, 173).
; PLAN: r0=430(x1), r1=244(y1), r2=477(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 244
LDI r2, 477
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
