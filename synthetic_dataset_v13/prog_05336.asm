; DESCRIPTION: Composite: Draws a magenta line from (85, 180) to (319, 133) then Places a red circle of radius 14 at center (483, 106).
; PLAN: r0=85(x1), r1=180(y1), r2=319(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=483(x), r6=106(y), r7=14(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 85
LDI r1, 180
LDI r2, 319
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 483
LDI r6, 106
LDI r7, 14
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
