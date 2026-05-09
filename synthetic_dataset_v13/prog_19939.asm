; DESCRIPTION: Draws a black line from (128, 182) to (97, 98).
; PLAN: r0=128(x1), r1=182(y1), r2=97(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 182
LDI r2, 97
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
