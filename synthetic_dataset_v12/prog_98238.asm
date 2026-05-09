; DESCRIPTION: Draws a green line from (166, 246) to (389, 140).
; PLAN: r0=166(x1), r1=246(y1), r2=389(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 246
LDI r2, 389
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
