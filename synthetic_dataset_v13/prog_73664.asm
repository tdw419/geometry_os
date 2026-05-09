; DESCRIPTION: Places a white line segment connecting (503, 30) to (430, 249).
; PLAN: r0=503(x1), r1=30(y1), r2=430(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 30
LDI r2, 430
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
