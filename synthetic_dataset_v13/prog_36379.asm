; DESCRIPTION: Draws a green line from (406, 99) to (327, 188).
; PLAN: r0=406(x1), r1=99(y1), r2=327(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 99
LDI r2, 327
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
