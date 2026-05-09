; DESCRIPTION: Draws a yellow line from (217, 114) to (109, 234).
; PLAN: r0=217(x1), r1=114(y1), r2=109(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 114
LDI r2, 109
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
