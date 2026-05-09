; DESCRIPTION: Draws a blue line from (259, 79) to (47, 242).
; PLAN: r0=259(x1), r1=79(y1), r2=47(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 79
LDI r2, 47
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
