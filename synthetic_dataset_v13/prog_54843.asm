; DESCRIPTION: Draws a yellow line from (490, 15) to (487, 73).
; PLAN: r0=490(x1), r1=15(y1), r2=487(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 15
LDI r2, 487
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
