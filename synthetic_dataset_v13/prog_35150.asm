; DESCRIPTION: Places a orange line segment connecting (129, 152) to (351, 174).
; PLAN: r0=129(x1), r1=152(y1), r2=351(x2), r3=174(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 152
LDI r2, 351
LDI r3, 174
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
