; DESCRIPTION: Places a red line segment connecting (444, 59) to (151, 68).
; PLAN: r0=444(x1), r1=59(y1), r2=151(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 59
LDI r2, 151
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
