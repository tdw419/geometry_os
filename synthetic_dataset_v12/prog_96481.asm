; DESCRIPTION: Draws a green line from (436, 246) to (253, 128).
; PLAN: r0=436(x1), r1=246(y1), r2=253(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 246
LDI r2, 253
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
