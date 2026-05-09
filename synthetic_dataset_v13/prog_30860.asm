; DESCRIPTION: Draws a yellow line from (11, 217) to (354, 132).
; PLAN: r0=11(x1), r1=217(y1), r2=354(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 217
LDI r2, 354
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
