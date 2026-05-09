; DESCRIPTION: Places a green line segment connecting (130, 42) to (265, 183).
; PLAN: r0=130(x1), r1=42(y1), r2=265(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 42
LDI r2, 265
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
