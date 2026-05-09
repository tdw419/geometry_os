; DESCRIPTION: Composite: Renders a blue box of size 39x27 starting at (31, 112) then Places a white dot at position (88, 55) then Draws a cyan circle centered at (295, 117) with radius 24.
; PLAN: r0=31(x), r1=112(y), r2=39(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=55(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=295(x), r11=117(y), r12=24(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 112
LDI r2, 39
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 55
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 295
LDI r11, 117
LDI r12, 24
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
