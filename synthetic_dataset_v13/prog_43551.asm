; DESCRIPTION: Places a white line segment connecting (505, 221) to (442, 156).
; PLAN: r0=505(x1), r1=221(y1), r2=442(x2), r3=156(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 221
LDI r2, 442
LDI r3, 156
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
