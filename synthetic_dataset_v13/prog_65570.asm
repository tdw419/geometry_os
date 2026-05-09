; DESCRIPTION: Composite: Renders a purple disk with center (275, 115) and radius 76 then Draws a cyan rectangle at (143, 9) with width 81 and height 112.
; PLAN: r0=275(x), r1=115(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=9(y), r7=81(width), r8=112(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 275
LDI r1, 115
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 9
LDI r7, 81
LDI r8, 112
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
