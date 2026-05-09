; DESCRIPTION: Draws a yellow line from (117, 182) to (309, 110).
; PLAN: r0=117(x1), r1=182(y1), r2=309(x2), r3=110(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 182
LDI r2, 309
LDI r3, 110
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
