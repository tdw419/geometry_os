; DESCRIPTION: Places a green line segment connecting (278, 153) to (304, 222).
; PLAN: r0=278(x1), r1=153(y1), r2=304(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 153
LDI r2, 304
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
