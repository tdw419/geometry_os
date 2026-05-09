; DESCRIPTION: Draws a yellow line from (325, 255) to (309, 246).
; PLAN: r0=325(x1), r1=255(y1), r2=309(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 255
LDI r2, 309
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
