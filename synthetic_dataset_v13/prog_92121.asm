; DESCRIPTION: Draws a orange line from (342, 141) to (125, 132).
; PLAN: r0=342(x1), r1=141(y1), r2=125(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 141
LDI r2, 125
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
