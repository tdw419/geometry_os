; DESCRIPTION: Composite: Renders a cyan disk with center (289, 236) and radius 15 then Draws a red rectangle at (268, 154) with width 17 and height 102 then Places a blue dot at position (292, 76).
; PLAN: r0=289(x), r1=236(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=154(y), r7=17(width), r8=102(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=292(x), r11=76(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 236
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 154
LDI r7, 17
LDI r8, 102
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 292
LDI r11, 76
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
