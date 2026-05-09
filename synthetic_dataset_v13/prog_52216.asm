; DESCRIPTION: Draws a green line from (357, 176) to (469, 19).
; PLAN: r0=357(x1), r1=176(y1), r2=469(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 176
LDI r2, 469
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
