; DESCRIPTION: Places a white line segment connecting (469, 76) to (156, 215).
; PLAN: r0=469(x1), r1=76(y1), r2=156(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 76
LDI r2, 156
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
