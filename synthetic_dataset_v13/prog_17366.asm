; DESCRIPTION: Draws a green line from (319, 240) to (45, 74).
; PLAN: r0=319(x1), r1=240(y1), r2=45(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 240
LDI r2, 45
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
