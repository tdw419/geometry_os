; DESCRIPTION: Places a white line segment connecting (328, 35) to (157, 72).
; PLAN: r0=328(x1), r1=35(y1), r2=157(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 35
LDI r2, 157
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
