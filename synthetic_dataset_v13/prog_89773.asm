; DESCRIPTION: Places a yellow line segment connecting (360, 13) to (300, 214).
; PLAN: r0=360(x1), r1=13(y1), r2=300(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 13
LDI r2, 300
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
