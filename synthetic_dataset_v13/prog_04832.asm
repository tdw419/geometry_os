; DESCRIPTION: Places a orange line segment connecting (465, 211) to (384, 26).
; PLAN: r0=465(x1), r1=211(y1), r2=384(x2), r3=26(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 211
LDI r2, 384
LDI r3, 26
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
