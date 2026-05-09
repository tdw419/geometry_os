; DESCRIPTION: Draws a magenta line from (122, 17) to (35, 132).
; PLAN: r0=122(x1), r1=17(y1), r2=35(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 17
LDI r2, 35
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
