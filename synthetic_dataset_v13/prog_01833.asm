; DESCRIPTION: Draws a green line from (91, 76) to (24, 247).
; PLAN: r0=91(x1), r1=76(y1), r2=24(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 76
LDI r2, 24
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
