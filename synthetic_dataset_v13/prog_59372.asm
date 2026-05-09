; DESCRIPTION: Draws a blue line from (373, 179) to (166, 120).
; PLAN: r0=373(x1), r1=179(y1), r2=166(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 179
LDI r2, 166
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
