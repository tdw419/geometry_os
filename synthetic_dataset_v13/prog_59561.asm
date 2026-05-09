; DESCRIPTION: Places a cyan line segment connecting (459, 58) to (308, 69).
; PLAN: r0=459(x1), r1=58(y1), r2=308(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 58
LDI r2, 308
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
