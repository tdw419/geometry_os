; DESCRIPTION: Places a red line segment connecting (248, 253) to (188, 68).
; PLAN: r0=248(x1), r1=253(y1), r2=188(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 253
LDI r2, 188
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
