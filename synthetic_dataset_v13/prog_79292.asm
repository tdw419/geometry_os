; DESCRIPTION: Places a yellow line segment connecting (156, 117) to (42, 163).
; PLAN: r0=156(x1), r1=117(y1), r2=42(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 117
LDI r2, 42
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
