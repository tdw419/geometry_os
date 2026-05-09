; DESCRIPTION: Places a orange line segment connecting (116, 180) to (441, 113).
; PLAN: r0=116(x1), r1=180(y1), r2=441(x2), r3=113(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 180
LDI r2, 441
LDI r3, 113
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
