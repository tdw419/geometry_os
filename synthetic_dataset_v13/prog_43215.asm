; DESCRIPTION: Draws a purple line from (188, 23) to (42, 1).
; PLAN: r0=188(x1), r1=23(y1), r2=42(x2), r3=1(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 23
LDI r2, 42
LDI r3, 1
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
