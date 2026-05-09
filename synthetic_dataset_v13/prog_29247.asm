; DESCRIPTION: Places a red line segment connecting (134, 154) to (16, 31).
; PLAN: r0=134(x1), r1=154(y1), r2=16(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 154
LDI r2, 16
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
