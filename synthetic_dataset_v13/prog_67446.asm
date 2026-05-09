; DESCRIPTION: Draws a purple line from (105, 167) to (46, 46).
; PLAN: r0=105(x1), r1=167(y1), r2=46(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 167
LDI r2, 46
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
