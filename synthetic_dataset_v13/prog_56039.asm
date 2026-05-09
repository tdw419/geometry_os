; DESCRIPTION: Draws a blue line from (28, 211) to (508, 46).
; PLAN: r0=28(x1), r1=211(y1), r2=508(x2), r3=46(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 211
LDI r2, 508
LDI r3, 46
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
