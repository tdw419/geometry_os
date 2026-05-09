; DESCRIPTION: Draws a yellow line from (7, 93) to (474, 130).
; PLAN: r0=7(x1), r1=93(y1), r2=474(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 93
LDI r2, 474
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
