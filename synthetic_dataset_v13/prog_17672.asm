; DESCRIPTION: Draws a green line from (457, 149) to (265, 247).
; PLAN: r0=457(x1), r1=149(y1), r2=265(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 149
LDI r2, 265
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
