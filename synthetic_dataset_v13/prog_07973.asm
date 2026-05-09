; DESCRIPTION: Places a red line segment connecting (330, 253) to (195, 248).
; PLAN: r0=330(x1), r1=253(y1), r2=195(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 253
LDI r2, 195
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
