; DESCRIPTION: Places a red line segment connecting (170, 206) to (324, 234).
; PLAN: r0=170(x1), r1=206(y1), r2=324(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 206
LDI r2, 324
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
