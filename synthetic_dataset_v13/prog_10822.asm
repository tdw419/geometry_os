; DESCRIPTION: Places a orange line segment connecting (262, 32) to (359, 169).
; PLAN: r0=262(x1), r1=32(y1), r2=359(x2), r3=169(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 32
LDI r2, 359
LDI r3, 169
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
