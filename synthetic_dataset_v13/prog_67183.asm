; DESCRIPTION: Places a red line segment connecting (81, 183) to (270, 63).
; PLAN: r0=81(x1), r1=183(y1), r2=270(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 183
LDI r2, 270
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
