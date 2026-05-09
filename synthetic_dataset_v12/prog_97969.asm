; DESCRIPTION: Places a white line segment connecting (100, 25) to (202, 212).
; PLAN: r0=100(x1), r1=25(y1), r2=202(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 25
LDI r2, 202
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
