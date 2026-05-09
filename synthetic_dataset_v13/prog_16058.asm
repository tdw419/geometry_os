; DESCRIPTION: Places a white line segment connecting (122, 165) to (490, 182).
; PLAN: r0=122(x1), r1=165(y1), r2=490(x2), r3=182(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 165
LDI r2, 490
LDI r3, 182
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
