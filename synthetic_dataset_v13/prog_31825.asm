; DESCRIPTION: Renders a red line between points (494, 63) and (291, 232).
; PLAN: r0=494(x1), r1=63(y1), r2=291(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 63
LDI r2, 291
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
