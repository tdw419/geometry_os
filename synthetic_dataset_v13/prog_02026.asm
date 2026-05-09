; DESCRIPTION: Draws a orange line from (372, 182) to (13, 195).
; PLAN: r0=372(x1), r1=182(y1), r2=13(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 182
LDI r2, 13
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
