; DESCRIPTION: Draws a yellow line from (397, 245) to (343, 135).
; PLAN: r0=397(x1), r1=245(y1), r2=343(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 245
LDI r2, 343
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
