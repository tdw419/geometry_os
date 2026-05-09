; DESCRIPTION: Places a red line segment connecting (307, 112) to (339, 223).
; PLAN: r0=307(x1), r1=112(y1), r2=339(x2), r3=223(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 112
LDI r2, 339
LDI r3, 223
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
