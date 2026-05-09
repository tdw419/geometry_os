; DESCRIPTION: Draws a green line from (54, 60) to (114, 245).
; PLAN: r0=54(x1), r1=60(y1), r2=114(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 60
LDI r2, 114
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
