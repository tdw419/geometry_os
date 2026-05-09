; DESCRIPTION: Places a red line segment connecting (286, 141) to (302, 141).
; PLAN: r0=286(x1), r1=141(y1), r2=302(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 141
LDI r2, 302
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
