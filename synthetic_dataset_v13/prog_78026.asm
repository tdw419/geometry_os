; DESCRIPTION: Places a red line segment connecting (259, 213) to (148, 194).
; PLAN: r0=259(x1), r1=213(y1), r2=148(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 213
LDI r2, 148
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
