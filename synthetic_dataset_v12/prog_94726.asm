; DESCRIPTION: Composite: Draws a green circle centered at (362, 103) with radius 76 then Draws a cyan rectangle at (358, 17) with width 19 and height 83 then Sets a single white pixel at (365, 28).
; PLAN: r0=362(x), r1=103(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=17(y), r7=19(width), r8=83(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=28(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 103
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 17
LDI r7, 19
LDI r8, 83
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 28
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
