; DESCRIPTION: Places a yellow line segment connecting (34, 148) to (295, 19).
; PLAN: r0=34(x1), r1=148(y1), r2=295(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 148
LDI r2, 295
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
