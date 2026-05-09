; DESCRIPTION: Draws a green line from (93, 139) to (441, 220).
; PLAN: r0=93(x1), r1=139(y1), r2=441(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 139
LDI r2, 441
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
