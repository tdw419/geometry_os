; DESCRIPTION: Draws a magenta line from (444, 187) to (19, 132).
; PLAN: r0=444(x1), r1=187(y1), r2=19(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 187
LDI r2, 19
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
