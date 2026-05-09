; DESCRIPTION: Places a black line segment connecting (155, 213) to (391, 167).
; PLAN: r0=155(x1), r1=213(y1), r2=391(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 213
LDI r2, 391
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
