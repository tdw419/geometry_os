; DESCRIPTION: Draws a purple line from (162, 27) to (408, 57).
; PLAN: r0=162(x1), r1=27(y1), r2=408(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 27
LDI r2, 408
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
