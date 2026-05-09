; DESCRIPTION: Places a red line segment connecting (54, 86) to (59, 65).
; PLAN: r0=54(x1), r1=86(y1), r2=59(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 86
LDI r2, 59
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
