; DESCRIPTION: Draws a magenta line from (457, 221) to (110, 132).
; PLAN: r0=457(x1), r1=221(y1), r2=110(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 221
LDI r2, 110
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
