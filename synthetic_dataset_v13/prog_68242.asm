; DESCRIPTION: Composite: Creates a cyan circular shape at (186, 34) with radius 21 then Places a orange dot at position (171, 88) then Draws a magenta rectangle at (245, 120) with width 62 and height 54.
; PLAN: r0=186(x), r1=34(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=88(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=245(x), r11=120(y), r12=62(width), r13=54(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 186
LDI r1, 34
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 88
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 245
LDI r11, 120
LDI r12, 62
LDI r13, 54
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
