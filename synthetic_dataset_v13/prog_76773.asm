; DESCRIPTION: Places a black line segment connecting (101, 171) to (127, 102).
; PLAN: r0=101(x1), r1=171(y1), r2=127(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 171
LDI r2, 127
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
