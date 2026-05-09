; DESCRIPTION: Composite: Places a yellow 75x78 rectangle at position (23, 59) then Draws a purple circle centered at (330, 74) with radius 74 then Places a white dot at position (81, 206).
; PLAN: r0=23(x), r1=59(y), r2=75(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=74(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=81(x), r11=206(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 23
LDI r1, 59
LDI r2, 75
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 74
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 81
LDI r11, 206
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
