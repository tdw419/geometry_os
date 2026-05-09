; DESCRIPTION: Places a red line segment connecting (425, 128) to (469, 238).
; PLAN: r0=425(x1), r1=128(y1), r2=469(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 128
LDI r2, 469
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
