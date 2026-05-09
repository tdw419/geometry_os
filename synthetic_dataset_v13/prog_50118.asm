; DESCRIPTION: Draws a green line from (10, 250) to (57, 17).
; PLAN: r0=10(x1), r1=250(y1), r2=57(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 250
LDI r2, 57
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
