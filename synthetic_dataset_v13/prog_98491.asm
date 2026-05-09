; DESCRIPTION: Draws a green line from (397, 28) to (3, 9).
; PLAN: r0=397(x1), r1=28(y1), r2=3(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 28
LDI r2, 3
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
