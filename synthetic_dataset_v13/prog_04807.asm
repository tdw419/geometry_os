; DESCRIPTION: Composite: Renders a black line between points (336, 171) and (391, 25) then Creates a cyan circular shape at (303, 87) with radius 33 then Places a magenta dot at position (315, 115).
; PLAN: r0=336(x1), r1=171(y1), r2=391(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=87(y), r7=33(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x), r11=115(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 336
LDI r1, 171
LDI r2, 391
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 87
LDI r7, 33
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 115
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
