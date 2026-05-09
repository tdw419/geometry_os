; DESCRIPTION: Renders a green line between points (276, 123) and (357, 178).
; PLAN: r0=276(x1), r1=123(y1), r2=357(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 123
LDI r2, 357
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
