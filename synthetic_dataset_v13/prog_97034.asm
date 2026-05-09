; DESCRIPTION: Draws a yellow line from (462, 230) to (378, 113).
; PLAN: r0=462(x1), r1=230(y1), r2=378(x2), r3=113(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 230
LDI r2, 378
LDI r3, 113
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
