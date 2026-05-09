; DESCRIPTION: Places a yellow line segment connecting (59, 95) to (275, 34).
; PLAN: r0=59(x1), r1=95(y1), r2=275(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 95
LDI r2, 275
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
