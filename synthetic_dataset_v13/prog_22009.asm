; DESCRIPTION: Places a orange line segment connecting (278, 19) to (213, 70).
; PLAN: r0=278(x1), r1=19(y1), r2=213(x2), r3=70(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 19
LDI r2, 213
LDI r3, 70
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
