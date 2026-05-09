; DESCRIPTION: Places a orange line segment connecting (374, 8) to (403, 0).
; PLAN: r0=374(x1), r1=8(y1), r2=403(x2), r3=0(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 8
LDI r2, 403
LDI r3, 0
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
