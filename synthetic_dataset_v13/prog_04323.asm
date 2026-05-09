; DESCRIPTION: Draws a green line from (86, 76) to (68, 247).
; PLAN: r0=86(x1), r1=76(y1), r2=68(x2), r3=247(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 76
LDI r2, 68
LDI r3, 247
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
