; DESCRIPTION: Places a white line segment connecting (444, 114) to (301, 56).
; PLAN: r0=444(x1), r1=114(y1), r2=301(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 114
LDI r2, 301
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
