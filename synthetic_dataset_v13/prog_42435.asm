; DESCRIPTION: Draws a red line from (366, 251) to (494, 44).
; PLAN: r0=366(x1), r1=251(y1), r2=494(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 251
LDI r2, 494
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
