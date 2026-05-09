; DESCRIPTION: Places a yellow line segment connecting (500, 249) to (360, 47).
; PLAN: r0=500(x1), r1=249(y1), r2=360(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 249
LDI r2, 360
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
