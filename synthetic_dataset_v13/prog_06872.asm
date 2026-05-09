; DESCRIPTION: Draws a magenta line from (135, 17) to (382, 115).
; PLAN: r0=135(x1), r1=17(y1), r2=382(x2), r3=115(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 17
LDI r2, 382
LDI r3, 115
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
