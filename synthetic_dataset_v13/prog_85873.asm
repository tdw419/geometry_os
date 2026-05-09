; DESCRIPTION: Draws a yellow line from (122, 181) to (354, 61).
; PLAN: r0=122(x1), r1=181(y1), r2=354(x2), r3=61(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 181
LDI r2, 354
LDI r3, 61
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
