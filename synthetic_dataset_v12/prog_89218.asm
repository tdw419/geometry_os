; DESCRIPTION: Draws a red line from (430, 75) to (383, 220).
; PLAN: r0=430(x1), r1=75(y1), r2=383(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 75
LDI r2, 383
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
