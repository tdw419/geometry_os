; DESCRIPTION: Places a green line segment connecting (227, 16) to (228, 130).
; PLAN: r0=227(x1), r1=16(y1), r2=228(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 16
LDI r2, 228
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
