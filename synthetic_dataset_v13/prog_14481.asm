; DESCRIPTION: Draws a purple line from (10, 116) to (103, 5).
; PLAN: r0=10(x1), r1=116(y1), r2=103(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 116
LDI r2, 103
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
