; DESCRIPTION: Composite: Sets a single magenta pixel at (143, 32) then Renders a cyan disk with center (357, 148) and radius 24 then Draws a orange rectangle at (390, 165) with width 98 and height 89.
; PLAN: r0=143(x), r1=32(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=357(x), r6=148(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x), r11=165(y), r12=98(width), r13=89(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 32
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 148
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 165
LDI r12, 98
LDI r13, 89
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
