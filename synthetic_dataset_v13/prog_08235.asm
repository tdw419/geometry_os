; DESCRIPTION: Draws a red line from (330, 37) to (496, 205).
; PLAN: r0=330(x1), r1=37(y1), r2=496(x2), r3=205(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 37
LDI r2, 496
LDI r3, 205
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
