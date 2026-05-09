; DESCRIPTION: Draws a purple line from (156, 20) to (143, 55).
; PLAN: r0=156(x1), r1=20(y1), r2=143(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 20
LDI r2, 143
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
