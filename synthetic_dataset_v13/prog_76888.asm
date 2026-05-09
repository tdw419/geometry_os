; DESCRIPTION: Draws a blue line from (5, 58) to (397, 223).
; PLAN: r0=5(x1), r1=58(y1), r2=397(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 58
LDI r2, 397
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
