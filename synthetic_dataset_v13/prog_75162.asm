; DESCRIPTION: Renders a yellow line between points (344, 62) and (330, 183).
; PLAN: r0=344(x1), r1=62(y1), r2=330(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 62
LDI r2, 330
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
