; DESCRIPTION: Draws a green line from (17, 82) to (501, 183).
; PLAN: r0=17(x1), r1=82(y1), r2=501(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 82
LDI r2, 501
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
