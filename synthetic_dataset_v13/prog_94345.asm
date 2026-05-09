; DESCRIPTION: Places a yellow line segment connecting (35, 39) to (336, 31).
; PLAN: r0=35(x1), r1=39(y1), r2=336(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 39
LDI r2, 336
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
