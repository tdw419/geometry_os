; DESCRIPTION: Composite: Creates a orange rectangular region at (240, 61) spanning 16 by 108 pixels then Draws a purple circle centered at (187, 73) with radius 68 then Sets a single yellow pixel at (94, 228).
; PLAN: r0=240(x), r1=61(y), r2=16(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=73(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=94(x), r11=228(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 61
LDI r2, 16
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 73
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 94
LDI r11, 228
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
