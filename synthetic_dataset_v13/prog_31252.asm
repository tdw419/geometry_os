; DESCRIPTION: Draws a green line from (157, 62) to (344, 196).
; PLAN: r0=157(x1), r1=62(y1), r2=344(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 62
LDI r2, 344
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
