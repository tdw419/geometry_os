; DESCRIPTION: Composite: Renders a blue box of size 57x101 starting at (49, 54) then Places a white dot at position (360, 202) then Places a cyan circle of radius 61 at center (282, 146).
; PLAN: r0=49(x), r1=54(y), r2=57(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=202(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=282(x), r11=146(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 49
LDI r1, 54
LDI r2, 57
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 202
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 282
LDI r11, 146
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
