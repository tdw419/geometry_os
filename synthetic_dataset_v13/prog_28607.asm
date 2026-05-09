; DESCRIPTION: Draws a yellow line from (364, 151) to (311, 178).
; PLAN: r0=364(x1), r1=151(y1), r2=311(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 151
LDI r2, 311
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
