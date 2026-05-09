; DESCRIPTION: Draws a yellow line from (259, 192) to (309, 1).
; PLAN: r0=259(x1), r1=192(y1), r2=309(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 192
LDI r2, 309
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
