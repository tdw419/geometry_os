; DESCRIPTION: Renders a green line between points (354, 188) and (266, 23).
; PLAN: r0=354(x1), r1=188(y1), r2=266(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 188
LDI r2, 266
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
