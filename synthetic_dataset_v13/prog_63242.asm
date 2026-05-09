; DESCRIPTION: Places a orange line segment connecting (413, 17) to (180, 246).
; PLAN: r0=413(x1), r1=17(y1), r2=180(x2), r3=246(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 17
LDI r2, 180
LDI r3, 246
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
