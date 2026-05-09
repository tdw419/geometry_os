; DESCRIPTION: Draws a magenta line from (153, 66) to (115, 86).
; PLAN: r0=153(x1), r1=66(y1), r2=115(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 66
LDI r2, 115
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
