; DESCRIPTION: Composite: Draws a orange circle centered at (294, 16) with radius 16 then Renders a magenta box of size 24x12 starting at (17, 194) then Places a orange dot at position (462, 18).
; PLAN: r0=294(x), r1=16(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=17(x), r6=194(y), r7=24(width), r8=12(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=462(x), r11=18(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 16
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 17
LDI r6, 194
LDI r7, 24
LDI r8, 12
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 18
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
