; DESCRIPTION: Composite: Renders a cyan disk with center (70, 158) and radius 42 then Sets a single magenta pixel at (375, 66) then Draws a magenta rectangle at (171, 10) with width 53 and height 40.
; PLAN: r0=70(x), r1=158(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=66(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=171(x), r11=10(y), r12=53(width), r13=40(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 158
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 66
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 171
LDI r11, 10
LDI r12, 53
LDI r13, 40
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
