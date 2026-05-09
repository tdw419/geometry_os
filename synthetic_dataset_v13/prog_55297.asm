; DESCRIPTION: Composite: Renders a yellow disk with center (167, 175) and radius 65 then Creates a cyan rectangular region at (416, 136) spanning 92 by 72 pixels then Sets a single orange pixel at (127, 151).
; PLAN: r0=167(x), r1=175(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=136(y), r7=92(width), r8=72(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=127(x), r11=151(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 167
LDI r1, 175
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 136
LDI r7, 92
LDI r8, 72
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 127
LDI r11, 151
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
