; DESCRIPTION: Places a green line segment connecting (342, 214) to (442, 24).
; PLAN: r0=342(x1), r1=214(y1), r2=442(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 214
LDI r2, 442
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
