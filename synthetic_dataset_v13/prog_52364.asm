; DESCRIPTION: Composite: Sets a single cyan pixel at (280, 94) then Draws a red rectangle at (372, 151) with width 10 and height 81 then Places a purple circle of radius 24 at center (252, 189).
; PLAN: r0=280(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=372(x), r6=151(y), r7=10(width), r8=81(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=252(x), r11=189(y), r12=24(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 280
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 372
LDI r6, 151
LDI r7, 10
LDI r8, 81
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 252
LDI r11, 189
LDI r12, 24
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
