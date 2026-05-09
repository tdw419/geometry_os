; DESCRIPTION: Draws a yellow line from (1, 15) to (107, 222).
; PLAN: r0=1(x1), r1=15(y1), r2=107(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 15
LDI r2, 107
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
