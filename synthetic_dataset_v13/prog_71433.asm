; DESCRIPTION: Places a orange line segment connecting (146, 179) to (189, 28).
; PLAN: r0=146(x1), r1=179(y1), r2=189(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 179
LDI r2, 189
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
