; DESCRIPTION: Draws a purple line from (135, 82) to (140, 127).
; PLAN: r0=135(x1), r1=82(y1), r2=140(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 82
LDI r2, 140
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
