; DESCRIPTION: Draws a yellow line from (58, 195) to (503, 205).
; PLAN: r0=58(x1), r1=195(y1), r2=503(x2), r3=205(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 195
LDI r2, 503
LDI r3, 205
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
