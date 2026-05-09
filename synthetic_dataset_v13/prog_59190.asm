; DESCRIPTION: Draws a green line from (8, 49) to (420, 130).
; PLAN: r0=8(x1), r1=49(y1), r2=420(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 49
LDI r2, 420
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
