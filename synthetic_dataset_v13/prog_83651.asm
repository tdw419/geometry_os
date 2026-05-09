; DESCRIPTION: Composite: Places a orange circle of radius 35 at center (129, 96) then Places a cyan dot at position (120, 188) then Draws a orange rectangle at (59, 64) with width 12 and height 108.
; PLAN: r0=129(x), r1=96(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=188(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=59(x), r11=64(y), r12=12(width), r13=108(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 129
LDI r1, 96
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 188
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 59
LDI r11, 64
LDI r12, 12
LDI r13, 108
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
