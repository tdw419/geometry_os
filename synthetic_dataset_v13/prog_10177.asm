; DESCRIPTION: Draws a magenta line from (492, 240) to (134, 197).
; PLAN: r0=492(x1), r1=240(y1), r2=134(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 240
LDI r2, 134
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
