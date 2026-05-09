; DESCRIPTION: Draws a yellow line from (166, 76) to (234, 142).
; PLAN: r0=166(x1), r1=76(y1), r2=234(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 76
LDI r2, 234
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
