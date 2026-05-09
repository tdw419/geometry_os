; DESCRIPTION: Composite: Sets a single orange pixel at (146, 155) then Places a red circle of radius 12 at center (299, 59) then Draws a cyan rectangle at (310, 68) with width 55 and height 10.
; PLAN: r0=146(x), r1=155(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=59(y), r7=12(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=310(x), r11=68(y), r12=55(width), r13=10(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 155
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 299
LDI r6, 59
LDI r7, 12
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 310
LDI r11, 68
LDI r12, 55
LDI r13, 10
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
