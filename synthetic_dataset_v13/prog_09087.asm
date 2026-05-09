; DESCRIPTION: Draws a white line from (194, 127) to (383, 136).
; PLAN: r0=194(x1), r1=127(y1), r2=383(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 127
LDI r2, 383
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
