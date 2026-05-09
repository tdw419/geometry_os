; DESCRIPTION: Draws a black line from (261, 117) to (466, 97).
; PLAN: r0=261(x1), r1=117(y1), r2=466(x2), r3=97(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 117
LDI r2, 466
LDI r3, 97
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
