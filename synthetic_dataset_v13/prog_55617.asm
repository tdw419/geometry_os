; DESCRIPTION: Renders a yellow line between points (429, 37) and (494, 176).
; PLAN: r0=429(x1), r1=37(y1), r2=494(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 37
LDI r2, 494
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
