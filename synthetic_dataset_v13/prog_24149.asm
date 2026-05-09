; DESCRIPTION: Draws a green line from (127, 40) to (472, 80).
; PLAN: r0=127(x1), r1=40(y1), r2=472(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 40
LDI r2, 472
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
