; DESCRIPTION: Draws a black line from (415, 70) to (497, 102).
; PLAN: r0=415(x1), r1=70(y1), r2=497(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 70
LDI r2, 497
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
