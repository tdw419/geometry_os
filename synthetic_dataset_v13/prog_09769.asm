; DESCRIPTION: Composite: Renders a black line between points (214, 163) and (12, 94) then Draws a red circle centered at (354, 86) with radius 74 then Places a cyan dot at position (185, 217).
; PLAN: r0=214(x1), r1=163(y1), r2=12(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=354(x), r6=86(y), r7=74(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=185(x), r11=217(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 163
LDI r2, 12
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 354
LDI r6, 86
LDI r7, 74
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 185
LDI r11, 217
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
