; DESCRIPTION: Draws a green line from (261, 250) to (315, 71).
; PLAN: r0=261(x1), r1=250(y1), r2=315(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 250
LDI r2, 315
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
