; DESCRIPTION: Draws a yellow line from (254, 13) to (286, 253).
; PLAN: r0=254(x1), r1=13(y1), r2=286(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 13
LDI r2, 286
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
