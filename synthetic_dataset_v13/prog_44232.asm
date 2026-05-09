; DESCRIPTION: Composite: Draws a magenta circle centered at (377, 122) with radius 53 then Places a red 70x87 rectangle at position (106, 79) then Places a orange dot at position (486, 109).
; PLAN: r0=377(x), r1=122(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=106(x), r6=79(y), r7=70(width), r8=87(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=486(x), r11=109(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 377
LDI r1, 122
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 106
LDI r6, 79
LDI r7, 70
LDI r8, 87
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 109
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
