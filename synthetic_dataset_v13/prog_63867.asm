; DESCRIPTION: Draws a white line from (383, 70) to (490, 39).
; PLAN: r0=383(x1), r1=70(y1), r2=490(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 70
LDI r2, 490
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
