; DESCRIPTION: Composite: Renders a green box of size 13x84 starting at (460, 20) then Places a magenta dot at position (38, 27) then Draws a magenta circle centered at (173, 62) with radius 40.
; PLAN: r0=460(x), r1=20(y), r2=13(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=27(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=173(x), r11=62(y), r12=40(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 460
LDI r1, 20
LDI r2, 13
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 27
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 173
LDI r11, 62
LDI r12, 40
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
