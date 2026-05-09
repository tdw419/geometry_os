; DESCRIPTION: Draws a yellow line from (260, 22) to (495, 183).
; PLAN: r0=260(x1), r1=22(y1), r2=495(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 22
LDI r2, 495
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
