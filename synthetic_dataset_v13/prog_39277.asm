; DESCRIPTION: Composite: Creates a blue circular shape at (327, 54) with radius 51 then Renders a white box of size 54x18 starting at (5, 78) then Places a white dot at position (450, 103).
; PLAN: r0=327(x), r1=54(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=78(y), r7=54(width), r8=18(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=450(x), r11=103(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 327
LDI r1, 54
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 78
LDI r7, 54
LDI r8, 18
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 103
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
