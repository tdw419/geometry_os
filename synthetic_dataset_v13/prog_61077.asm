; DESCRIPTION: Draws a orange line from (127, 178) to (511, 71).
; PLAN: r0=127(x1), r1=178(y1), r2=511(x2), r3=71(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 178
LDI r2, 511
LDI r3, 71
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
