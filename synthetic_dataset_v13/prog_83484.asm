; DESCRIPTION: Draws a magenta line from (172, 79) to (309, 9).
; PLAN: r0=172(x1), r1=79(y1), r2=309(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 79
LDI r2, 309
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
