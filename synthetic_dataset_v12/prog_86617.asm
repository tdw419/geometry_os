; DESCRIPTION: Draws a yellow line from (413, 13) to (40, 83).
; PLAN: r0=413(x1), r1=13(y1), r2=40(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 13
LDI r2, 40
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
