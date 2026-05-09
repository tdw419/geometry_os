; DESCRIPTION: Composite: Draws a white circle centered at (304, 119) with radius 76 then Renders a white line between points (124, 82) and (301, 103) then Sets a single black pixel at (334, 143).
; PLAN: r0=304(x), r1=119(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x1), r6=82(y1), r7=301(x2), r8=103(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=143(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 119
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 82
LDI r7, 301
LDI r8, 103
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 143
LDI r12, 0x000000
PSET r10, r11, r12
HALT
