; DESCRIPTION: Places a green line segment connecting (309, 78) to (123, 214).
; PLAN: r0=309(x1), r1=78(y1), r2=123(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 78
LDI r2, 123
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
