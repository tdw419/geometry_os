; DESCRIPTION: Draws a purple line from (114, 42) to (26, 22).
; PLAN: r0=114(x1), r1=42(y1), r2=26(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 42
LDI r2, 26
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
