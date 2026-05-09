; DESCRIPTION: Composite: Creates a yellow circular shape at (295, 104) with radius 60 then Creates a black rectangular region at (127, 54) spanning 111 by 74 pixels then Sets a single magenta pixel at (87, 210).
; PLAN: r0=295(x), r1=104(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x), r6=54(y), r7=111(width), r8=74(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=87(x), r11=210(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 104
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 54
LDI r7, 111
LDI r8, 74
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 210
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
