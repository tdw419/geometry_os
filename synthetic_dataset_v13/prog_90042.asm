; DESCRIPTION: Places a red line segment connecting (60, 9) to (202, 35).
; PLAN: r0=60(x1), r1=9(y1), r2=202(x2), r3=35(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 9
LDI r2, 202
LDI r3, 35
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
