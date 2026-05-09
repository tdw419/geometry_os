; DESCRIPTION: Composite: Renders a orange box of size 95x120 starting at (309, 28) then Places a magenta circle of radius 42 at center (338, 97) then Places a orange dot at position (195, 176).
; PLAN: r0=309(x), r1=28(y), r2=95(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=338(x), r6=97(y), r7=42(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=195(x), r11=176(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 309
LDI r1, 28
LDI r2, 95
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 338
LDI r6, 97
LDI r7, 42
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 195
LDI r11, 176
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
