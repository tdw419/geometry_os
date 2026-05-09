; DESCRIPTION: Draws a green line from (61, 16) to (318, 216).
; PLAN: r0=61(x1), r1=16(y1), r2=318(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 16
LDI r2, 318
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
