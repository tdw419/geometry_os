; DESCRIPTION: Draws a black line from (251, 26) to (71, 127).
; PLAN: r0=251(x1), r1=26(y1), r2=71(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 26
LDI r2, 71
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
