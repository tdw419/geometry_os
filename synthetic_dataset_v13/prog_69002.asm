; DESCRIPTION: Places a yellow line segment connecting (268, 194) to (293, 0).
; PLAN: r0=268(x1), r1=194(y1), r2=293(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 194
LDI r2, 293
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
