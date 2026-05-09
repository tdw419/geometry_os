; DESCRIPTION: Composite: Draws a black circle centered at (34, 62) with radius 27 then Renders a black box of size 42x99 starting at (132, 11) then Places a green dot at position (53, 56).
; PLAN: r0=34(x), r1=62(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=11(y), r7=42(width), r8=99(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x), r11=56(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 34
LDI r1, 62
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 11
LDI r7, 42
LDI r8, 99
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 56
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
