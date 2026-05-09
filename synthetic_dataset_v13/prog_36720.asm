; DESCRIPTION: Places a orange line segment connecting (335, 209) to (433, 43).
; PLAN: r0=335(x1), r1=209(y1), r2=433(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 209
LDI r2, 433
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
