; DESCRIPTION: Places a black line segment connecting (304, 68) to (218, 130).
; PLAN: r0=304(x1), r1=68(y1), r2=218(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 68
LDI r2, 218
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
