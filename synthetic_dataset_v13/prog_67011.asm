; DESCRIPTION: Places a yellow line segment connecting (81, 214) to (397, 246).
; PLAN: r0=81(x1), r1=214(y1), r2=397(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 214
LDI r2, 397
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
