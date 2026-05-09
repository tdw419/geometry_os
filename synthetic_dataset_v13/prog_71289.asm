; DESCRIPTION: Composite: Creates a red rectangular region at (382, 55) spanning 88 by 61 pixels then Creates a magenta circular shape at (460, 53) with radius 23 then Places a white dot at position (81, 152).
; PLAN: r0=382(x), r1=55(y), r2=88(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=460(x), r6=53(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x), r11=152(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 382
LDI r1, 55
LDI r2, 88
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 53
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 152
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
