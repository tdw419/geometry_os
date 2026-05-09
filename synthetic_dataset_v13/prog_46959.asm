; DESCRIPTION: Draws a blue line from (43, 194) to (216, 143).
; PLAN: r0=43(x1), r1=194(y1), r2=216(x2), r3=143(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 194
LDI r2, 216
LDI r3, 143
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
