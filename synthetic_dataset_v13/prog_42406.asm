; DESCRIPTION: Draws a yellow line from (465, 101) to (275, 183).
; PLAN: r0=465(x1), r1=101(y1), r2=275(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 101
LDI r2, 275
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
