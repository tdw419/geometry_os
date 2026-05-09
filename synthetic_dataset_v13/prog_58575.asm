; DESCRIPTION: Renders a magenta line between points (349, 38) and (494, 82).
; PLAN: r0=349(x1), r1=38(y1), r2=494(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 38
LDI r2, 494
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
