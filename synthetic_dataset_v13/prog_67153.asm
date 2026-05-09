; DESCRIPTION: Composite: Renders a red line between points (438, 213) and (306, 36) then Draws a red circle centered at (391, 145) with radius 69 then Places a cyan dot at position (491, 173).
; PLAN: r0=438(x1), r1=213(y1), r2=306(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=145(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=491(x), r11=173(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 438
LDI r1, 213
LDI r2, 306
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 145
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 491
LDI r11, 173
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
