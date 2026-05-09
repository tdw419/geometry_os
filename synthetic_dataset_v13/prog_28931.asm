; DESCRIPTION: Renders a magenta line between points (276, 15) and (371, 130).
; PLAN: r0=276(x1), r1=15(y1), r2=371(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 15
LDI r2, 371
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
