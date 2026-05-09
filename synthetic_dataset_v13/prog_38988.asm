; DESCRIPTION: Composite: Creates a red rectangular region at (120, 57) spanning 116 by 94 pixels then Draws a red circle centered at (446, 160) with radius 31 then Sets a single black pixel at (421, 87).
; PLAN: r0=120(x), r1=57(y), r2=116(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=160(y), r7=31(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=421(x), r11=87(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 120
LDI r1, 57
LDI r2, 116
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 160
LDI r7, 31
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 421
LDI r11, 87
LDI r12, 0x000000
PSET r10, r11, r12
HALT
