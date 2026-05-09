; DESCRIPTION: Composite: Sets a single green pixel at (79, 39) then Places a red circle of radius 34 at center (187, 75) then Draws a green line from (376, 235) to (431, 23).
; PLAN: r0=79(x), r1=39(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=75(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x1), r11=235(y1), r12=431(x2), r13=23(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 39
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 187
LDI r6, 75
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 235
LDI r12, 431
LDI r13, 23
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
