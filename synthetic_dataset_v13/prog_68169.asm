; DESCRIPTION: Composite: Renders a blue disk with center (174, 143) and radius 49 then Creates a magenta rectangular region at (259, 74) spanning 30 by 56 pixels then Sets a single yellow pixel at (8, 43).
; PLAN: r0=174(x), r1=143(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x), r6=74(y), r7=30(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=8(x), r11=43(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 174
LDI r1, 143
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 74
LDI r7, 30
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 8
LDI r11, 43
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
