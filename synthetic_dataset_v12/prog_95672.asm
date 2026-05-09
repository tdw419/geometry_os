; DESCRIPTION: Places a green line segment connecting (25, 123) to (494, 223).
; PLAN: r0=25(x1), r1=123(y1), r2=494(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 123
LDI r2, 494
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
