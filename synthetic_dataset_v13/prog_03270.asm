; DESCRIPTION: Draws a green line from (412, 173) to (497, 181).
; PLAN: r0=412(x1), r1=173(y1), r2=497(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 173
LDI r2, 497
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
