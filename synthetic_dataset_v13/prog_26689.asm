; DESCRIPTION: Draws a yellow line from (286, 5) to (151, 46).
; PLAN: r0=286(x1), r1=5(y1), r2=151(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 5
LDI r2, 151
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
