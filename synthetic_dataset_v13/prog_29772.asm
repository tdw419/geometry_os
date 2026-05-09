; DESCRIPTION: Draws a white line from (111, 99) to (8, 251).
; PLAN: r0=111(x1), r1=99(y1), r2=8(x2), r3=251(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 99
LDI r2, 8
LDI r3, 251
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
