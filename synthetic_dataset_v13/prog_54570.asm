; DESCRIPTION: Draws a yellow line from (33, 199) to (96, 62).
; PLAN: r0=33(x1), r1=199(y1), r2=96(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 199
LDI r2, 96
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
