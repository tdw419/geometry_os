; DESCRIPTION: Composite: Creates a red circular shape at (115, 164) with radius 12 then Draws a green rectangle at (264, 173) with width 63 and height 59 then Sets a single green pixel at (198, 74).
; PLAN: r0=115(x), r1=164(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=264(x), r6=173(y), r7=63(width), r8=59(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x), r11=74(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 115
LDI r1, 164
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 264
LDI r6, 173
LDI r7, 63
LDI r8, 59
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 74
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
