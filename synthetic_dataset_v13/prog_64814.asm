; DESCRIPTION: Places a white line segment connecting (120, 212) to (179, 28).
; PLAN: r0=120(x1), r1=212(y1), r2=179(x2), r3=28(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 212
LDI r2, 179
LDI r3, 28
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
