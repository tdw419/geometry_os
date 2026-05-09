; DESCRIPTION: Places a orange line segment connecting (266, 131) to (263, 113).
; PLAN: r0=266(x1), r1=131(y1), r2=263(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 131
LDI r2, 263
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
