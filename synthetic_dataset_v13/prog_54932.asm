; DESCRIPTION: Places a black line segment connecting (54, 173) to (157, 34).
; PLAN: r0=54(x1), r1=173(y1), r2=157(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 173
LDI r2, 157
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
