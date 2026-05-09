; DESCRIPTION: Composite: Draws a red rectangle at (450, 159) with width 55 and height 26 then Places a white dot at position (91, 242) then Draws a orange circle centered at (180, 93) with radius 70.
; PLAN: r0=450(x), r1=159(y), r2=55(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=91(x), r6=242(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=180(x), r11=93(y), r12=70(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 450
LDI r1, 159
LDI r2, 55
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 91
LDI r6, 242
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 180
LDI r11, 93
LDI r12, 70
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
