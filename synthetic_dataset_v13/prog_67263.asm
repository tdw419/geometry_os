; DESCRIPTION: Places a white line segment connecting (232, 193) to (218, 56).
; PLAN: r0=232(x1), r1=193(y1), r2=218(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 193
LDI r2, 218
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
