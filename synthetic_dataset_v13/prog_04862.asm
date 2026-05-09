; DESCRIPTION: Places a green line segment connecting (218, 129) to (416, 247).
; PLAN: r0=218(x1), r1=129(y1), r2=416(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 129
LDI r2, 416
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
