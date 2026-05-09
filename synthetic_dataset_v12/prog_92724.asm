; DESCRIPTION: Draws a green line from (378, 180) to (3, 100).
; PLAN: r0=378(x1), r1=180(y1), r2=3(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 180
LDI r2, 3
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
