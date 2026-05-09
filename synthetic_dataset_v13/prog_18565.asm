; DESCRIPTION: Places a yellow line segment connecting (115, 245) to (40, 42).
; PLAN: r0=115(x1), r1=245(y1), r2=40(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 245
LDI r2, 40
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
