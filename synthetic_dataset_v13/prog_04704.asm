; DESCRIPTION: Draws a orange line from (105, 213) to (440, 25).
; PLAN: r0=105(x1), r1=213(y1), r2=440(x2), r3=25(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 213
LDI r2, 440
LDI r3, 25
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
