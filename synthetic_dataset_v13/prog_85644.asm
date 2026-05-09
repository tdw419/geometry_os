; DESCRIPTION: Draws a yellow line from (301, 115) to (280, 183).
; PLAN: r0=301(x1), r1=115(y1), r2=280(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 115
LDI r2, 280
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
