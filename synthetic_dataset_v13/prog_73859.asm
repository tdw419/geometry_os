; DESCRIPTION: Draws a black line from (118, 117) to (11, 114).
; PLAN: r0=118(x1), r1=117(y1), r2=11(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 117
LDI r2, 11
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
