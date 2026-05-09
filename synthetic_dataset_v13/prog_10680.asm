; DESCRIPTION: Composite: Draws a green rectangle at (191, 167) with width 95 and height 25 then Draws a cyan circle centered at (242, 164) with radius 79 then Places a orange dot at position (287, 215).
; PLAN: r0=191(x), r1=167(y), r2=95(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=164(y), r7=79(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=287(x), r11=215(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 191
LDI r1, 167
LDI r2, 95
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 164
LDI r7, 79
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 287
LDI r11, 215
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
