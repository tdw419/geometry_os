; DESCRIPTION: Composite: Places a black 29x115 rectangle at position (249, 125) then Creates a yellow circular shape at (54, 168) with radius 19 then Sets a single yellow pixel at (140, 46).
; PLAN: r0=249(x), r1=125(y), r2=29(width), r3=115(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=54(x), r6=168(y), r7=19(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=140(x), r11=46(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 249
LDI r1, 125
LDI r2, 29
LDI r3, 115
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 168
LDI r7, 19
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 140
LDI r11, 46
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
