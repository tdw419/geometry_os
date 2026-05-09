; DESCRIPTION: Places a red line segment connecting (205, 47) to (129, 244).
; PLAN: r0=205(x1), r1=47(y1), r2=129(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 47
LDI r2, 129
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
