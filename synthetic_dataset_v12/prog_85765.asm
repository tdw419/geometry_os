; DESCRIPTION: Draws a yellow line from (250, 40) to (210, 21).
; PLAN: r0=250(x1), r1=40(y1), r2=210(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 40
LDI r2, 210
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
