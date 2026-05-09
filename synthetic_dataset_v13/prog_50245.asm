; DESCRIPTION: Places a red line segment connecting (218, 108) to (388, 135).
; PLAN: r0=218(x1), r1=108(y1), r2=388(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 108
LDI r2, 388
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
