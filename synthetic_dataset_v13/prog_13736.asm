; DESCRIPTION: Places a yellow line segment connecting (68, 82) to (46, 227).
; PLAN: r0=68(x1), r1=82(y1), r2=46(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 82
LDI r2, 46
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
