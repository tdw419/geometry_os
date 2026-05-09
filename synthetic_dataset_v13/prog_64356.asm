; DESCRIPTION: Draws a green line from (300, 46) to (212, 81).
; PLAN: r0=300(x1), r1=46(y1), r2=212(x2), r3=81(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 46
LDI r2, 212
LDI r3, 81
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
