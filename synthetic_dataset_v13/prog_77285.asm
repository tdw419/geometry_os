; DESCRIPTION: Places a red line segment connecting (108, 211) to (406, 234).
; PLAN: r0=108(x1), r1=211(y1), r2=406(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 211
LDI r2, 406
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
