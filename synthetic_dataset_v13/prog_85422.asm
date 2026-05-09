; DESCRIPTION: Draws a blue line from (217, 59) to (143, 189).
; PLAN: r0=217(x1), r1=59(y1), r2=143(x2), r3=189(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 59
LDI r2, 143
LDI r3, 189
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
