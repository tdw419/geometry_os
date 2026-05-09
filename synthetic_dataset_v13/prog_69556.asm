; DESCRIPTION: Places a red line segment connecting (196, 247) to (157, 81).
; PLAN: r0=196(x1), r1=247(y1), r2=157(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 247
LDI r2, 157
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
