; DESCRIPTION: Places a orange line segment connecting (405, 183) to (175, 107).
; PLAN: r0=405(x1), r1=183(y1), r2=175(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 183
LDI r2, 175
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
