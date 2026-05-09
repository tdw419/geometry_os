; DESCRIPTION: Places a green line segment connecting (42, 35) to (204, 234).
; PLAN: r0=42(x1), r1=35(y1), r2=204(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 35
LDI r2, 204
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
