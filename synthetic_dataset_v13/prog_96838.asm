; DESCRIPTION: Composite: Places a red circle of radius 19 at center (438, 205) then Renders a orange box of size 18x62 starting at (474, 172) then Places a white dot at position (394, 139).
; PLAN: r0=438(x), r1=205(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=172(y), r7=18(width), r8=62(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x), r11=139(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 438
LDI r1, 205
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 172
LDI r7, 18
LDI r8, 62
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 139
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
