; DESCRIPTION: Composite: Draws a white rectangle at (209, 0) with width 84 and height 66 then Sets a single green pixel at (86, 18).
; PLAN: r0=209(x), r1=0(y), r2=84(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=18(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 0
LDI r2, 84
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 18
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
