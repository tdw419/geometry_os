; DESCRIPTION: Draws a green line from (378, 84) to (303, 166).
; PLAN: r0=378(x1), r1=84(y1), r2=303(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 84
LDI r2, 303
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
