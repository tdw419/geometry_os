; DESCRIPTION: Places a black line segment connecting (34, 253) to (171, 106).
; PLAN: r0=34(x1), r1=253(y1), r2=171(x2), r3=106(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 253
LDI r2, 171
LDI r3, 106
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
