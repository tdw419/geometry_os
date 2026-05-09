; DESCRIPTION: Composite: Renders a magenta disk with center (326, 80) and radius 57 then Places a red line segment connecting (31, 81) to (486, 146) then Sets a single red pixel at (408, 207).
; PLAN: r0=326(x), r1=80(y), r2=57(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x1), r6=81(y1), r7=486(x2), r8=146(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=207(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 80
LDI r2, 57
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 81
LDI r7, 486
LDI r8, 146
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 207
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
