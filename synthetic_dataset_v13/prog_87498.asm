; DESCRIPTION: Draws a orange line from (423, 240) to (126, 53).
; PLAN: r0=423(x1), r1=240(y1), r2=126(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 240
LDI r2, 126
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
