; DESCRIPTION: Places a white line segment connecting (65, 50) to (212, 157).
; PLAN: r0=65(x1), r1=50(y1), r2=212(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 50
LDI r2, 212
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
