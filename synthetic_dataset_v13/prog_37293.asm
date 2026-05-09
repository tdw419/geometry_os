; DESCRIPTION: Composite: Places a blue line segment connecting (309, 133) to (328, 18) then Sets a single magenta pixel at (204, 57).
; PLAN: r0=309(x1), r1=133(y1), r2=328(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=204(x), r6=57(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 309
LDI r1, 133
LDI r2, 328
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 57
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
