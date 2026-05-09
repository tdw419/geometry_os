; DESCRIPTION: Draws a purple line from (272, 230) to (275, 165).
; PLAN: r0=272(x1), r1=230(y1), r2=275(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 230
LDI r2, 275
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
