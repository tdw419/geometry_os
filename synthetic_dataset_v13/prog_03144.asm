; DESCRIPTION: Draws a yellow line from (156, 176) to (312, 126).
; PLAN: r0=156(x1), r1=176(y1), r2=312(x2), r3=126(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 176
LDI r2, 312
LDI r3, 126
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
