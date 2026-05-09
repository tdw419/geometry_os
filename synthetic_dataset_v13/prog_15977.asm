; DESCRIPTION: Composite: Draws a yellow circle centered at (295, 83) with radius 57 then Sets a single magenta pixel at (483, 101) then Draws a red rectangle at (439, 174) with width 61 and height 46.
; PLAN: r0=295(x), r1=83(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=483(x), r6=101(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=439(x), r11=174(y), r12=61(width), r13=46(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 295
LDI r1, 83
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 483
LDI r6, 101
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 439
LDI r11, 174
LDI r12, 61
LDI r13, 46
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
