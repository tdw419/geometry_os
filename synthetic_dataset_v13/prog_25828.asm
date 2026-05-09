; DESCRIPTION: Draws a yellow line from (56, 66) to (251, 173).
; PLAN: r0=56(x1), r1=66(y1), r2=251(x2), r3=173(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 66
LDI r2, 251
LDI r3, 173
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
