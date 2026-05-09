; DESCRIPTION: Places a green line segment connecting (501, 53) to (42, 52).
; PLAN: r0=501(x1), r1=53(y1), r2=42(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 53
LDI r2, 42
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
