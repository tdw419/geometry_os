; DESCRIPTION: Draws a green line from (266, 245) to (67, 245).
; PLAN: r0=266(x1), r1=245(y1), r2=67(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 245
LDI r2, 67
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
