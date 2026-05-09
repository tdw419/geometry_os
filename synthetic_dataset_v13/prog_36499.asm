; DESCRIPTION: Draws a yellow line from (397, 134) to (87, 108).
; PLAN: r0=397(x1), r1=134(y1), r2=87(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 134
LDI r2, 87
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
