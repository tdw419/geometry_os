; DESCRIPTION: Draws a purple line from (77, 120) to (166, 123).
; PLAN: r0=77(x1), r1=120(y1), r2=166(x2), r3=123(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 120
LDI r2, 166
LDI r3, 123
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
