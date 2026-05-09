; DESCRIPTION: Draws a green line from (430, 211) to (144, 114).
; PLAN: r0=430(x1), r1=211(y1), r2=144(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 211
LDI r2, 144
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
