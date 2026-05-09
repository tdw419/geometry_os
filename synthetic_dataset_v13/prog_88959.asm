; DESCRIPTION: Composite: Renders a white disk with center (273, 97) and radius 41 then Places a red 69x28 rectangle at position (231, 64) then Sets a single purple pixel at (38, 224).
; PLAN: r0=273(x), r1=97(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x), r6=64(y), r7=69(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=38(x), r11=224(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 273
LDI r1, 97
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 64
LDI r7, 69
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 224
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
