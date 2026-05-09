; DESCRIPTION: Composite: Places a green circle of radius 57 at center (268, 178) then Renders a cyan box of size 63x15 starting at (395, 49) then Places a green dot at position (291, 136).
; PLAN: r0=268(x), r1=178(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=395(x), r6=49(y), r7=63(width), r8=15(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=291(x), r11=136(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 268
LDI r1, 178
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 395
LDI r6, 49
LDI r7, 63
LDI r8, 15
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 291
LDI r11, 136
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
