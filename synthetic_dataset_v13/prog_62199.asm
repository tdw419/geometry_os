; DESCRIPTION: Places a green line segment connecting (42, 185) to (245, 31).
; PLAN: r0=42(x1), r1=185(y1), r2=245(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 185
LDI r2, 245
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
