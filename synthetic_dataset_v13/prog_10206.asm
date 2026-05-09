; DESCRIPTION: Composite: Places a black circle of radius 75 at center (304, 119) then Renders a cyan box of size 25x75 starting at (134, 16) then Places a white dot at position (239, 46).
; PLAN: r0=304(x), r1=119(y), r2=75(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=16(y), r7=25(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=239(x), r11=46(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 119
LDI r2, 75
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 16
LDI r7, 25
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 46
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
