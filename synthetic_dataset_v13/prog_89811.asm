; DESCRIPTION: Draws a green line from (219, 240) to (97, 251).
; PLAN: r0=219(x1), r1=240(y1), r2=97(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 240
LDI r2, 97
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
