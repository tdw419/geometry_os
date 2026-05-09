; DESCRIPTION: Draws a yellow line from (321, 226) to (165, 200).
; PLAN: r0=321(x1), r1=226(y1), r2=165(x2), r3=200(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 226
LDI r2, 165
LDI r3, 200
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
