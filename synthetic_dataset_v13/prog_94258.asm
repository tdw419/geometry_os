; DESCRIPTION: Places a orange line segment connecting (463, 124) to (171, 246).
; PLAN: r0=463(x1), r1=124(y1), r2=171(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 124
LDI r2, 171
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
