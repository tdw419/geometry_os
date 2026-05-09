; DESCRIPTION: Places a red line segment connecting (138, 233) to (114, 175).
; PLAN: r0=138(x1), r1=233(y1), r2=114(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 233
LDI r2, 114
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
