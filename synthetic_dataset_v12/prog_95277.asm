; DESCRIPTION: Draws a purple line from (339, 85) to (103, 42).
; PLAN: r0=339(x1), r1=85(y1), r2=103(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 85
LDI r2, 103
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
