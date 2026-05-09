; DESCRIPTION: Places a red line segment connecting (204, 225) to (286, 102).
; PLAN: r0=204(x1), r1=225(y1), r2=286(x2), r3=102(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 225
LDI r2, 286
LDI r3, 102
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
