; DESCRIPTION: Composite: Sets a single white pixel at (41, 203) then Places a orange 84x99 rectangle at position (18, 146) then Renders a red disk with center (438, 130) and radius 63.
; PLAN: r0=41(x), r1=203(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=18(x), r6=146(y), r7=84(width), r8=99(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=438(x), r11=130(y), r12=63(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 41
LDI r1, 203
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 18
LDI r6, 146
LDI r7, 84
LDI r8, 99
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 438
LDI r11, 130
LDI r12, 63
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
