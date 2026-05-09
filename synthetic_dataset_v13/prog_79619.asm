; DESCRIPTION: Places a red line segment connecting (360, 80) to (455, 14).
; PLAN: r0=360(x1), r1=80(y1), r2=455(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 80
LDI r2, 455
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
