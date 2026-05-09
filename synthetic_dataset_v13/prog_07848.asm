; DESCRIPTION: Draws a yellow line from (87, 20) to (388, 246).
; PLAN: r0=87(x1), r1=20(y1), r2=388(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 20
LDI r2, 388
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
