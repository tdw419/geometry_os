; DESCRIPTION: Composite: Places a black dot at position (32, 163) then Draws a red line from (217, 163) to (363, 74) then Draws a white circle centered at (134, 53) with radius 35.
; PLAN: r0=32(x), r1=163(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=217(x1), r6=163(y1), r7=363(x2), r8=74(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=53(y), r12=35(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 32
LDI r1, 163
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 217
LDI r6, 163
LDI r7, 363
LDI r8, 74
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 53
LDI r12, 35
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
