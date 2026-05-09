; DESCRIPTION: Composite: Places a blue 75x71 rectangle at position (38, 68) then Draws a blue circle centered at (233, 97) with radius 78 then Sets a single cyan pixel at (245, 96).
; PLAN: r0=38(x), r1=68(y), r2=75(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=97(y), r7=78(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=245(x), r11=96(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 38
LDI r1, 68
LDI r2, 75
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 97
LDI r7, 78
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 245
LDI r11, 96
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
