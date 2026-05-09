; DESCRIPTION: Places a red line segment connecting (86, 60) to (8, 180).
; PLAN: r0=86(x1), r1=60(y1), r2=8(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 60
LDI r2, 8
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
