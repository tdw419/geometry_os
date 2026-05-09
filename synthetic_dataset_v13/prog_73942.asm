; DESCRIPTION: Draws a green line from (391, 163) to (379, 216).
; PLAN: r0=391(x1), r1=163(y1), r2=379(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 163
LDI r2, 379
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
