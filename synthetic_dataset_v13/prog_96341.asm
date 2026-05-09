; DESCRIPTION: Draws a yellow line from (59, 22) to (381, 8).
; PLAN: r0=59(x1), r1=22(y1), r2=381(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 22
LDI r2, 381
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
