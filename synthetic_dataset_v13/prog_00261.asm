; DESCRIPTION: Draws a black line from (127, 182) to (104, 47).
; PLAN: r0=127(x1), r1=182(y1), r2=104(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 182
LDI r2, 104
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
