; DESCRIPTION: Places a magenta line segment connecting (318, 221) to (248, 52).
; PLAN: r0=318(x1), r1=221(y1), r2=248(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 221
LDI r2, 248
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
