; DESCRIPTION: Draws a yellow line from (244, 49) to (188, 125).
; PLAN: r0=244(x1), r1=49(y1), r2=188(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 49
LDI r2, 188
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
