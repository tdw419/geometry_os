; DESCRIPTION: Places a orange line segment connecting (19, 65) to (42, 144).
; PLAN: r0=19(x1), r1=65(y1), r2=42(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 65
LDI r2, 42
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
