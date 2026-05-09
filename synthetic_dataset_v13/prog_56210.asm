; DESCRIPTION: Draws a black line from (187, 246) to (364, 251).
; PLAN: r0=187(x1), r1=246(y1), r2=364(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 246
LDI r2, 364
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
