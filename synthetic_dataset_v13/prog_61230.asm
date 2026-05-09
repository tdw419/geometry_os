; DESCRIPTION: Places a red line segment connecting (171, 23) to (360, 160).
; PLAN: r0=171(x1), r1=23(y1), r2=360(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 23
LDI r2, 360
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
