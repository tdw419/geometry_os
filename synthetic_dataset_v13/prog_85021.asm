; DESCRIPTION: Places a red line segment connecting (123, 32) to (247, 238).
; PLAN: r0=123(x1), r1=32(y1), r2=247(x2), r3=238(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 32
LDI r2, 247
LDI r3, 238
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
