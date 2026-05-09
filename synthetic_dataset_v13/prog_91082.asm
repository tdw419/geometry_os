; DESCRIPTION: Places a red line segment connecting (183, 223) to (73, 173).
; PLAN: r0=183(x1), r1=223(y1), r2=73(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 223
LDI r2, 73
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
