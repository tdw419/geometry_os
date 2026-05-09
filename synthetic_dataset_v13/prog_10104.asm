; DESCRIPTION: Places a green line segment connecting (383, 101) to (308, 91).
; PLAN: r0=383(x1), r1=101(y1), r2=308(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 101
LDI r2, 308
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
