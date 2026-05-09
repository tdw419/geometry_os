; DESCRIPTION: Draws a blue line from (391, 98) to (405, 98).
; PLAN: r0=391(x1), r1=98(y1), r2=405(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 98
LDI r2, 405
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
