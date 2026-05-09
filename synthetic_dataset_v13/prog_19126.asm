; DESCRIPTION: Places a orange line segment connecting (116, 168) to (374, 172).
; PLAN: r0=116(x1), r1=168(y1), r2=374(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 168
LDI r2, 374
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
