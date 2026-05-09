; DESCRIPTION: Composite: Draws a green line from (477, 246) to (481, 98) then Draws a green circle centered at (391, 42) with radius 31 then Sets a single magenta pixel at (470, 203).
; PLAN: r0=477(x1), r1=246(y1), r2=481(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=42(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=470(x), r11=203(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 477
LDI r1, 246
LDI r2, 481
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 42
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 470
LDI r11, 203
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
