; DESCRIPTION: Places a green line segment connecting (42, 103) to (137, 232).
; PLAN: r0=42(x1), r1=103(y1), r2=137(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 103
LDI r2, 137
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
