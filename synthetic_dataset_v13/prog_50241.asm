; DESCRIPTION: Draws a green line from (280, 232) to (19, 98).
; PLAN: r0=280(x1), r1=232(y1), r2=19(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 232
LDI r2, 19
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
