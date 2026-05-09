; DESCRIPTION: Places a red line segment connecting (372, 57) to (364, 191).
; PLAN: r0=372(x1), r1=57(y1), r2=364(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 57
LDI r2, 364
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
