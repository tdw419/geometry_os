; DESCRIPTION: Composite: Places a green circle of radius 53 at center (271, 168) then Sets a single white pixel at (175, 61) then Draws a white rectangle at (189, 56) with width 61 and height 47.
; PLAN: r0=271(x), r1=168(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=61(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=189(x), r11=56(y), r12=61(width), r13=47(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 271
LDI r1, 168
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 61
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 189
LDI r11, 56
LDI r12, 61
LDI r13, 47
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
