; DESCRIPTION: Places a red line segment connecting (171, 160) to (14, 160).
; PLAN: r0=171(x1), r1=160(y1), r2=14(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 160
LDI r2, 14
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
