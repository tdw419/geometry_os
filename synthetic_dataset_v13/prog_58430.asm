; DESCRIPTION: Places a orange line segment connecting (175, 114) to (256, 32).
; PLAN: r0=175(x1), r1=114(y1), r2=256(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 114
LDI r2, 256
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
