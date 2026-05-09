; DESCRIPTION: Draws a green line from (359, 55) to (9, 17).
; PLAN: r0=359(x1), r1=55(y1), r2=9(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 55
LDI r2, 9
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
