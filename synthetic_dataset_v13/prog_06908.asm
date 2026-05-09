; DESCRIPTION: Draws a yellow line from (4, 72) to (375, 132).
; PLAN: r0=4(x1), r1=72(y1), r2=375(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 72
LDI r2, 375
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
