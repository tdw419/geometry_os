; DESCRIPTION: Draws a magenta line from (306, 5) to (349, 251).
; PLAN: r0=306(x1), r1=5(y1), r2=349(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 5
LDI r2, 349
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
