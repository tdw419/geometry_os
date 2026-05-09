; DESCRIPTION: Draws a black line from (381, 127) to (60, 144).
; PLAN: r0=381(x1), r1=127(y1), r2=60(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 127
LDI r2, 60
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
