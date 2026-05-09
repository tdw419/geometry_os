; DESCRIPTION: Draws a green line from (336, 251) to (388, 127).
; PLAN: r0=336(x1), r1=251(y1), r2=388(x2), r3=127(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 251
LDI r2, 388
LDI r3, 127
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
