; DESCRIPTION: Places a orange line segment connecting (270, 22) to (217, 236).
; PLAN: r0=270(x1), r1=22(y1), r2=217(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 22
LDI r2, 217
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
