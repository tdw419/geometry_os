; DESCRIPTION: Places a orange line segment connecting (135, 48) to (300, 244).
; PLAN: r0=135(x1), r1=48(y1), r2=300(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 48
LDI r2, 300
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
