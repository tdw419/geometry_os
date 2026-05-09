; DESCRIPTION: Composite: Places a magenta dot at position (291, 134) then Renders a yellow box of size 21x63 starting at (16, 3) then Draws a cyan circle centered at (464, 214) with radius 18.
; PLAN: r0=291(x), r1=134(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=16(x), r6=3(y), r7=21(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=464(x), r11=214(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 134
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 16
LDI r6, 3
LDI r7, 21
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 464
LDI r11, 214
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
