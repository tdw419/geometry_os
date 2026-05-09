; DESCRIPTION: Composite: Draws a cyan circle centered at (271, 162) with radius 27 then Creates a magenta rectangular region at (145, 192) spanning 71 by 55 pixels then Sets a single red pixel at (370, 234).
; PLAN: r0=271(x), r1=162(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x), r6=192(y), r7=71(width), r8=55(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x), r11=234(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 162
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 192
LDI r7, 71
LDI r8, 55
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 234
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
