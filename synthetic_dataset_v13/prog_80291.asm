; DESCRIPTION: Places a orange line segment connecting (383, 220) to (67, 174).
; PLAN: r0=383(x1), r1=220(y1), r2=67(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 220
LDI r2, 67
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
