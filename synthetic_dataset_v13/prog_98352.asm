; DESCRIPTION: Places a orange line segment connecting (164, 213) to (217, 31).
; PLAN: r0=164(x1), r1=213(y1), r2=217(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 213
LDI r2, 217
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
