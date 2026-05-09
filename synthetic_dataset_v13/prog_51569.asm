; DESCRIPTION: Composite: Draws a black rectangle at (242, 55) with width 42 and height 70 then Places a white circle of radius 41 at center (196, 105).
; PLAN: r0=242(x), r1=55(y), r2=42(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x), r6=105(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 242
LDI r1, 55
LDI r2, 42
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 105
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
