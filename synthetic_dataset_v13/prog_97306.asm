; DESCRIPTION: Composite: Renders a green box of size 76x62 starting at (164, 152) then Draws a magenta circle centered at (99, 156) with radius 69 then Places a red dot at position (99, 180).
; PLAN: r0=164(x), r1=152(y), r2=76(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=156(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=99(x), r11=180(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 152
LDI r2, 76
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 156
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 99
LDI r11, 180
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
