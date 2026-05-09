; DESCRIPTION: Places a red line segment connecting (261, 138) to (473, 183).
; PLAN: r0=261(x1), r1=138(y1), r2=473(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 138
LDI r2, 473
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
