; DESCRIPTION: Draws a orange line from (40, 149) to (319, 132).
; PLAN: r0=40(x1), r1=149(y1), r2=319(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 149
LDI r2, 319
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
