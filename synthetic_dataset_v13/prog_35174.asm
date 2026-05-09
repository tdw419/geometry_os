; DESCRIPTION: Draws a green line from (441, 2) to (383, 49).
; PLAN: r0=441(x1), r1=2(y1), r2=383(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 2
LDI r2, 383
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
