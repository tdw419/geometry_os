; DESCRIPTION: Draws a yellow line from (89, 29) to (59, 39).
; PLAN: r0=89(x1), r1=29(y1), r2=59(x2), r3=39(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 29
LDI r2, 59
LDI r3, 39
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
