; DESCRIPTION: Composite: Renders a yellow line between points (296, 23) and (102, 133) then Sets a single magenta pixel at (347, 68).
; PLAN: r0=296(x1), r1=23(y1), r2=102(x2), r3=133(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=347(x), r6=68(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 296
LDI r1, 23
LDI r2, 102
LDI r3, 133
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 347
LDI r6, 68
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
