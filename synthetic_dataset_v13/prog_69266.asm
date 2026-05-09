; DESCRIPTION: Places a yellow line segment connecting (59, 61) to (494, 59).
; PLAN: r0=59(x1), r1=61(y1), r2=494(x2), r3=59(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 61
LDI r2, 494
LDI r3, 59
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
