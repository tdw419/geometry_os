; DESCRIPTION: Draws a green line from (319, 253) to (178, 188).
; PLAN: r0=319(x1), r1=253(y1), r2=178(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 253
LDI r2, 178
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
