; DESCRIPTION: Composite: Draws a white circle centered at (184, 116) with radius 63 then Creates a magenta rectangular region at (389, 36) spanning 117 by 102 pixels then Sets a single cyan pixel at (479, 66).
; PLAN: r0=184(x), r1=116(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x), r6=36(y), r7=117(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=479(x), r11=66(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 116
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 36
LDI r7, 117
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 479
LDI r11, 66
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
