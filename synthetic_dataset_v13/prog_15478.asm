; DESCRIPTION: Composite: Renders a white line between points (226, 108) and (135, 130) then Draws a orange rectangle at (289, 66) with width 96 and height 105 then Places a orange dot at position (141, 103).
; PLAN: r0=226(x1), r1=108(y1), r2=135(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=66(y), r7=96(width), r8=105(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=141(x), r11=103(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 108
LDI r2, 135
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 66
LDI r7, 96
LDI r8, 105
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 141
LDI r11, 103
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
