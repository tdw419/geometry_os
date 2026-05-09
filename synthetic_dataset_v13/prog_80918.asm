; DESCRIPTION: Draws a green line from (278, 206) to (397, 199).
; PLAN: r0=278(x1), r1=206(y1), r2=397(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 206
LDI r2, 397
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
