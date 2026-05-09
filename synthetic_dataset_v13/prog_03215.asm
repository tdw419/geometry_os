; DESCRIPTION: Draws a blue line from (71, 230) to (272, 96).
; PLAN: r0=71(x1), r1=230(y1), r2=272(x2), r3=96(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 230
LDI r2, 272
LDI r3, 96
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
