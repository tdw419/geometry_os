; DESCRIPTION: Places a white line segment connecting (284, 148) to (304, 119).
; PLAN: r0=284(x1), r1=148(y1), r2=304(x2), r3=119(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 148
LDI r2, 304
LDI r3, 119
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
