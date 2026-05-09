; DESCRIPTION: Composite: Draws a cyan rectangle at (72, 85) with width 60 and height 39 then Sets a single cyan pixel at (413, 2) then Renders a orange disk with center (249, 88) and radius 54.
; PLAN: r0=72(x), r1=85(y), r2=60(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=2(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=249(x), r11=88(y), r12=54(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 72
LDI r1, 85
LDI r2, 60
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 2
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 249
LDI r11, 88
LDI r12, 54
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
