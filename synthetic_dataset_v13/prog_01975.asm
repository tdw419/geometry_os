; DESCRIPTION: Places a black line segment connecting (223, 175) to (203, 42).
; PLAN: r0=223(x1), r1=175(y1), r2=203(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 175
LDI r2, 203
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
