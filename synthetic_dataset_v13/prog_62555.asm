; DESCRIPTION: Draws a black line from (192, 151) to (82, 183).
; PLAN: r0=192(x1), r1=151(y1), r2=82(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 151
LDI r2, 82
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
