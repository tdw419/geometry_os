; DESCRIPTION: Draws a yellow line from (234, 209) to (25, 106).
; PLAN: r0=234(x1), r1=209(y1), r2=25(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 209
LDI r2, 25
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
