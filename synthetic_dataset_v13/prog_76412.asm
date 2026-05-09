; DESCRIPTION: Places a red line segment connecting (258, 103) to (495, 54).
; PLAN: r0=258(x1), r1=103(y1), r2=495(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 103
LDI r2, 495
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
