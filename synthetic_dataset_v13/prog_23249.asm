; DESCRIPTION: Places a white line segment connecting (465, 122) to (101, 223).
; PLAN: r0=465(x1), r1=122(y1), r2=101(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 122
LDI r2, 101
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
