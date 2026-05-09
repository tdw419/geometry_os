; DESCRIPTION: Places a cyan line segment connecting (462, 155) to (303, 227).
; PLAN: r0=462(x1), r1=155(y1), r2=303(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 155
LDI r2, 303
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
