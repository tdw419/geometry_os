; DESCRIPTION: Places a black line segment connecting (39, 212) to (276, 71).
; PLAN: r0=39(x1), r1=212(y1), r2=276(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 212
LDI r2, 276
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
