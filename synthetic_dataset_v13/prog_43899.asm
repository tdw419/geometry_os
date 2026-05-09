; DESCRIPTION: Composite: Places a cyan circle of radius 79 at center (317, 82) then Draws a magenta line from (375, 29) to (95, 116) then Sets a single blue pixel at (233, 32).
; PLAN: r0=317(x), r1=82(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x1), r6=29(y1), r7=95(x2), r8=116(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=233(x), r11=32(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 317
LDI r1, 82
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 29
LDI r7, 95
LDI r8, 116
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 233
LDI r11, 32
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
