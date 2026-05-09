; DESCRIPTION: Places a red line segment connecting (506, 189) to (148, 141).
; PLAN: r0=506(x1), r1=189(y1), r2=148(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 189
LDI r2, 148
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
