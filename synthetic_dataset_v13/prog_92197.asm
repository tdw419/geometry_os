; DESCRIPTION: Places a orange line segment connecting (271, 8) to (269, 204).
; PLAN: r0=271(x1), r1=8(y1), r2=269(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 8
LDI r2, 269
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
