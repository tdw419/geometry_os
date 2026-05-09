; DESCRIPTION: Places a white line segment connecting (103, 164) to (423, 252).
; PLAN: r0=103(x1), r1=164(y1), r2=423(x2), r3=252(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 164
LDI r2, 423
LDI r3, 252
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
