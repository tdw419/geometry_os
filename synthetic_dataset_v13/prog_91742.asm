; DESCRIPTION: Draws a green line from (174, 139) to (15, 233).
; PLAN: r0=174(x1), r1=139(y1), r2=15(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 139
LDI r2, 15
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
