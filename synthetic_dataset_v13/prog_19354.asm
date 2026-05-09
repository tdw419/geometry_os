; DESCRIPTION: Draws a white line from (397, 52) to (208, 11).
; PLAN: r0=397(x1), r1=52(y1), r2=208(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 52
LDI r2, 208
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
