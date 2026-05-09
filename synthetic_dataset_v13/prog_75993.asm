; DESCRIPTION: Composite: Places a cyan line segment connecting (226, 184) to (293, 44) then Draws a white circle centered at (319, 138) with radius 65 then Sets a single black pixel at (167, 36).
; PLAN: r0=226(x1), r1=184(y1), r2=293(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=138(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=167(x), r11=36(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 184
LDI r2, 293
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 138
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 167
LDI r11, 36
LDI r12, 0x000000
PSET r10, r11, r12
HALT
