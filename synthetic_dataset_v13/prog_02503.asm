; DESCRIPTION: Draws a green line from (26, 55) to (54, 156).
; PLAN: r0=26(x1), r1=55(y1), r2=54(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 55
LDI r2, 54
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
