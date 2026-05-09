; DESCRIPTION: Draws a yellow line from (8, 19) to (265, 251).
; PLAN: r0=8(x1), r1=19(y1), r2=265(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 19
LDI r2, 265
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
