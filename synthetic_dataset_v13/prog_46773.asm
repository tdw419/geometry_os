; DESCRIPTION: Places a red line segment connecting (473, 161) to (272, 206).
; PLAN: r0=473(x1), r1=161(y1), r2=272(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 161
LDI r2, 272
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
