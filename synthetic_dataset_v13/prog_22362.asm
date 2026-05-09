; DESCRIPTION: Draws a yellow line from (234, 230) to (397, 48).
; PLAN: r0=234(x1), r1=230(y1), r2=397(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 230
LDI r2, 397
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
