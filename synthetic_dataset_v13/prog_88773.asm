; DESCRIPTION: Draws a cyan line from (357, 170) to (379, 199).
; PLAN: r0=357(x1), r1=170(y1), r2=379(x2), r3=199(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 170
LDI r2, 379
LDI r3, 199
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
