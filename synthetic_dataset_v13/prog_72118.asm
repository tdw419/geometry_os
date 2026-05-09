; DESCRIPTION: Places a red line segment connecting (266, 134) to (263, 84).
; PLAN: r0=266(x1), r1=134(y1), r2=263(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 134
LDI r2, 263
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
