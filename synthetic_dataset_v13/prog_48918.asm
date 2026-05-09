; DESCRIPTION: Draws a white line from (497, 78) to (475, 207).
; PLAN: r0=497(x1), r1=78(y1), r2=475(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 78
LDI r2, 475
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
