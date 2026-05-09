; DESCRIPTION: Places a red line segment connecting (33, 43) to (112, 202).
; PLAN: r0=33(x1), r1=43(y1), r2=112(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 43
LDI r2, 112
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
