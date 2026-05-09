; DESCRIPTION: Draws a magenta line from (339, 90) to (456, 253).
; PLAN: r0=339(x1), r1=90(y1), r2=456(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 90
LDI r2, 456
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
