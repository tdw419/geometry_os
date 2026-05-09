; DESCRIPTION: Draws a black line from (461, 26) to (378, 215).
; PLAN: r0=461(x1), r1=26(y1), r2=378(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 26
LDI r2, 378
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
