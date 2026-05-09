; DESCRIPTION: Places a red line segment connecting (108, 34) to (124, 28).
; PLAN: r0=108(x1), r1=34(y1), r2=124(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 34
LDI r2, 124
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
