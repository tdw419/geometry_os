; DESCRIPTION: Composite: Renders a white disk with center (361, 53) and radius 44 then Places a black 64x26 rectangle at position (446, 189) then Sets a single cyan pixel at (135, 149).
; PLAN: r0=361(x), r1=53(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=189(y), r7=64(width), r8=26(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x), r11=149(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 361
LDI r1, 53
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 189
LDI r7, 64
LDI r8, 26
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 149
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
