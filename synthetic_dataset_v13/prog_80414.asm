; DESCRIPTION: Composite: Renders a blue disk with center (199, 134) and radius 49 then Creates a cyan rectangular region at (249, 98) spanning 106 by 24 pixels then Sets a single yellow pixel at (479, 20).
; PLAN: r0=199(x), r1=134(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=98(y), r7=106(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x), r11=20(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 199
LDI r1, 134
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 98
LDI r7, 106
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 20
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
