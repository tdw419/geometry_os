; DESCRIPTION: Draws a yellow line from (208, 145) to (157, 114).
; PLAN: r0=208(x1), r1=145(y1), r2=157(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 145
LDI r2, 157
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
