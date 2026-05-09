; DESCRIPTION: Draws a yellow line from (144, 28) to (238, 8).
; PLAN: r0=144(x1), r1=28(y1), r2=238(x2), r3=8(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 28
LDI r2, 238
LDI r3, 8
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
