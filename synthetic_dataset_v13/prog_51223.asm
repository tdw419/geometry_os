; DESCRIPTION: Draws a orange line from (333, 6) to (190, 103).
; PLAN: r0=333(x1), r1=6(y1), r2=190(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 6
LDI r2, 190
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
