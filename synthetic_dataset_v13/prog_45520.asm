; DESCRIPTION: Composite: Renders a yellow box of size 47x105 starting at (254, 8) then Renders a white disk with center (125, 167) and radius 67 then Places a magenta dot at position (360, 154).
; PLAN: r0=254(x), r1=8(y), r2=47(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=167(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=360(x), r11=154(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 254
LDI r1, 8
LDI r2, 47
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 167
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 360
LDI r11, 154
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
