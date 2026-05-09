; DESCRIPTION: Composite: Renders a magenta disk with center (30, 238) and radius 18 then Renders a magenta box of size 15x100 starting at (108, 26) then Places a white dot at position (435, 183).
; PLAN: r0=30(x), r1=238(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x), r6=26(y), r7=15(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=435(x), r11=183(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 30
LDI r1, 238
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 26
LDI r7, 15
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 183
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
