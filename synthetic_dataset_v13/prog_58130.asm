; DESCRIPTION: Draws a magenta line from (66, 125) to (19, 175).
; PLAN: r0=66(x1), r1=125(y1), r2=19(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 125
LDI r2, 19
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
