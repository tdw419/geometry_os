; DESCRIPTION: Draws a green line from (100, 225) to (431, 253).
; PLAN: r0=100(x1), r1=225(y1), r2=431(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 225
LDI r2, 431
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
