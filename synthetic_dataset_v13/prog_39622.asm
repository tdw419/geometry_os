; DESCRIPTION: Composite: Creates a red circular shape at (106, 130) with radius 59 then Sets a single white pixel at (121, 78) then Draws a white rectangle at (281, 53) with width 61 and height 57.
; PLAN: r0=106(x), r1=130(y), r2=59(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=78(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=53(y), r12=61(width), r13=57(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 106
LDI r1, 130
LDI r2, 59
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 78
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 281
LDI r11, 53
LDI r12, 61
LDI r13, 57
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
