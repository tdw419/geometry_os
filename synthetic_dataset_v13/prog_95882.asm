; DESCRIPTION: Draws a yellow line from (31, 25) to (239, 84).
; PLAN: r0=31(x1), r1=25(y1), r2=239(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 25
LDI r2, 239
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
