; DESCRIPTION: Draws a green line from (233, 15) to (378, 37).
; PLAN: r0=233(x1), r1=15(y1), r2=378(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 15
LDI r2, 378
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
