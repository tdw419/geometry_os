; DESCRIPTION: Composite: Draws a white circle centered at (230, 133) with radius 38 then Places a yellow 81x27 rectangle at position (37, 106) then Places a orange dot at position (134, 208).
; PLAN: r0=230(x), r1=133(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=106(y), r7=81(width), r8=27(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=208(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 230
LDI r1, 133
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 106
LDI r7, 81
LDI r8, 27
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 208
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
