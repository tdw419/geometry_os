; DESCRIPTION: Composite: Draws a green rectangle at (383, 183) with width 18 and height 54 then Sets a single cyan pixel at (87, 98) then Renders a blue disk with center (281, 135) and radius 71.
; PLAN: r0=383(x), r1=183(y), r2=18(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=98(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=135(y), r12=71(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 383
LDI r1, 183
LDI r2, 18
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 98
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 281
LDI r11, 135
LDI r12, 71
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
