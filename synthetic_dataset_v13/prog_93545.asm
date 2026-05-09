; DESCRIPTION: Places a white line segment connecting (302, 190) to (412, 241).
; PLAN: r0=302(x1), r1=190(y1), r2=412(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 190
LDI r2, 412
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
