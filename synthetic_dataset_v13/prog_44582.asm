; DESCRIPTION: Draws a yellow line from (280, 44) to (248, 245).
; PLAN: r0=280(x1), r1=44(y1), r2=248(x2), r3=245(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 44
LDI r2, 248
LDI r3, 245
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
