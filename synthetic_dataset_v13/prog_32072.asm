; DESCRIPTION: Draws a purple line from (4, 74) to (148, 42).
; PLAN: r0=4(x1), r1=74(y1), r2=148(x2), r3=42(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 74
LDI r2, 148
LDI r3, 42
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
