; DESCRIPTION: Places a red line segment connecting (275, 3) to (234, 149).
; PLAN: r0=275(x1), r1=3(y1), r2=234(x2), r3=149(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 3
LDI r2, 234
LDI r3, 149
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
