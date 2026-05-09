; DESCRIPTION: Places a red line segment connecting (302, 32) to (412, 104).
; PLAN: r0=302(x1), r1=32(y1), r2=412(x2), r3=104(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 32
LDI r2, 412
LDI r3, 104
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
