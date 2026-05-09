; DESCRIPTION: Composite: Draws a green circle centered at (393, 95) with radius 38 then Places a green 55x34 rectangle at position (31, 120) then Places a orange dot at position (63, 49).
; PLAN: r0=393(x), r1=95(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=120(y), r7=55(width), r8=34(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=63(x), r11=49(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 393
LDI r1, 95
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 120
LDI r7, 55
LDI r8, 34
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 63
LDI r11, 49
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
