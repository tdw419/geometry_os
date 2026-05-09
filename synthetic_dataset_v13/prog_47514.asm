; DESCRIPTION: Places a red line segment connecting (253, 86) to (166, 126).
; PLAN: r0=253(x1), r1=86(y1), r2=166(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 86
LDI r2, 166
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
