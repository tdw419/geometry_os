; DESCRIPTION: Draws a yellow line from (241, 39) to (244, 84).
; PLAN: r0=241(x1), r1=39(y1), r2=244(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 39
LDI r2, 244
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
