; DESCRIPTION: Composite: Places a magenta circle of radius 36 at center (216, 154) then Draws a cyan rectangle at (329, 118) with width 116 and height 15 then Places a cyan dot at position (138, 86).
; PLAN: r0=216(x), r1=154(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=118(y), r7=116(width), r8=15(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=138(x), r11=86(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 154
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 118
LDI r7, 116
LDI r8, 15
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 138
LDI r11, 86
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
