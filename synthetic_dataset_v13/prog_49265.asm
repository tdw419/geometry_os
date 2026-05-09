; DESCRIPTION: Draws a green line from (106, 234) to (456, 217).
; PLAN: r0=106(x1), r1=234(y1), r2=456(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 234
LDI r2, 456
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
