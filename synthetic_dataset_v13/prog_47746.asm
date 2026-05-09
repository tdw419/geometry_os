; DESCRIPTION: Places a blue line segment connecting (28, 146) to (304, 102).
; PLAN: r0=28(x1), r1=146(y1), r2=304(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 146
LDI r2, 304
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
