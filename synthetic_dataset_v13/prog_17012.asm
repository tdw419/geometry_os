; DESCRIPTION: Composite: Places a cyan dot at position (467, 41) then Renders a purple disk with center (383, 130) and radius 13 then Draws a red rectangle at (282, 193) with width 65 and height 23.
; PLAN: r0=467(x), r1=41(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=130(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=282(x), r11=193(y), r12=65(width), r13=23(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 41
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 383
LDI r6, 130
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 282
LDI r11, 193
LDI r12, 65
LDI r13, 23
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
