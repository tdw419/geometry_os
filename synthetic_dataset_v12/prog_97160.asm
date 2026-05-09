; DESCRIPTION: Draws a white line from (121, 170) to (195, 250).
; PLAN: r0=121(x1), r1=170(y1), r2=195(x2), r3=250(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 170
LDI r2, 195
LDI r3, 250
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
