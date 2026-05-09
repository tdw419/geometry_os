; DESCRIPTION: Draws a orange line from (425, 197) to (5, 5).
; PLAN: r0=425(x1), r1=197(y1), r2=5(x2), r3=5(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 197
LDI r2, 5
LDI r3, 5
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
