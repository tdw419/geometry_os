; DESCRIPTION: Draws a orange line from (61, 37) to (424, 195).
; PLAN: r0=61(x1), r1=37(y1), r2=424(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 37
LDI r2, 424
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
