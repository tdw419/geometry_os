; DESCRIPTION: Places a green line segment connecting (339, 54) to (42, 81).
; PLAN: r0=339(x1), r1=54(y1), r2=42(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 54
LDI r2, 42
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
