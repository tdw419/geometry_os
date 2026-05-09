; DESCRIPTION: Places a white line segment connecting (284, 185) to (411, 80).
; PLAN: r0=284(x1), r1=185(y1), r2=411(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 185
LDI r2, 411
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
