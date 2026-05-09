; DESCRIPTION: Draws a blue line from (307, 207) to (306, 97).
; PLAN: r0=307(x1), r1=207(y1), r2=306(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 207
LDI r2, 306
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
