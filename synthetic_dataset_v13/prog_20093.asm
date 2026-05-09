; DESCRIPTION: Composite: Creates a blue circular shape at (403, 196) with radius 13 then Draws a green rectangle at (346, 3) with width 62 and height 92 then Sets a single orange pixel at (364, 198).
; PLAN: r0=403(x), r1=196(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=346(x), r6=3(y), r7=62(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=364(x), r11=198(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 196
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 346
LDI r6, 3
LDI r7, 62
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 198
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
