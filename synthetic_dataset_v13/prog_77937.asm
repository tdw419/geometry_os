; DESCRIPTION: Draws a yellow line from (378, 222) to (505, 134).
; PLAN: r0=378(x1), r1=222(y1), r2=505(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 222
LDI r2, 505
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
