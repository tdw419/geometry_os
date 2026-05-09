; DESCRIPTION: Places a orange line segment connecting (184, 206) to (441, 174).
; PLAN: r0=184(x1), r1=206(y1), r2=441(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 206
LDI r2, 441
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
