; DESCRIPTION: Composite: Creates a purple rectangular region at (64, 36) spanning 85 by 80 pixels then Draws a yellow circle centered at (177, 129) with radius 64 then Sets a single magenta pixel at (465, 88).
; PLAN: r0=64(x), r1=36(y), r2=85(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=129(y), r7=64(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=465(x), r11=88(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 64
LDI r1, 36
LDI r2, 85
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 129
LDI r7, 64
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 465
LDI r11, 88
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
