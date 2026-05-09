; DESCRIPTION: Places a orange line segment connecting (217, 251) to (371, 178).
; PLAN: r0=217(x1), r1=251(y1), r2=371(x2), r3=178(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 251
LDI r2, 371
LDI r3, 178
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
