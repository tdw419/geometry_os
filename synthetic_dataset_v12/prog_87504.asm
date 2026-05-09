; DESCRIPTION: Composite: Places a magenta dot at position (453, 243) then Draws a orange rectangle at (375, 160) with width 71 and height 42 then Places a black circle of radius 65 at center (253, 162).
; PLAN: r0=453(x), r1=243(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=160(y), r7=71(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=253(x), r11=162(y), r12=65(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 453
LDI r1, 243
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 160
LDI r7, 71
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 162
LDI r12, 65
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
