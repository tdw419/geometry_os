; DESCRIPTION: Composite: Renders a white box of size 27x76 starting at (106, 141) then Places a magenta circle of radius 39 at center (233, 158) then Places a blue dot at position (399, 7).
; PLAN: r0=106(x), r1=141(y), r2=27(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=158(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x), r11=7(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 141
LDI r2, 27
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 158
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 7
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
