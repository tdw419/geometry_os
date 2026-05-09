; DESCRIPTION: Draws a green line from (97, 93) to (81, 245).
; PLAN: r0=97(x1), r1=93(y1), r2=81(x2), r3=245(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 93
LDI r2, 81
LDI r3, 245
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
