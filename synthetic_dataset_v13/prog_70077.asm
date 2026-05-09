; DESCRIPTION: Draws a blue line from (378, 213) to (174, 159).
; PLAN: r0=378(x1), r1=213(y1), r2=174(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 213
LDI r2, 174
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
