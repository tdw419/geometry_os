; DESCRIPTION: Draws a orange line from (7, 37) to (40, 226).
; PLAN: r0=7(x1), r1=37(y1), r2=40(x2), r3=226(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 37
LDI r2, 40
LDI r3, 226
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
