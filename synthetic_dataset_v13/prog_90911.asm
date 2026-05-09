; DESCRIPTION: Composite: Renders a orange box of size 45x113 starting at (122, 32) then Sets a single blue pixel at (435, 194) then Renders a cyan disk with center (391, 91) and radius 78.
; PLAN: r0=122(x), r1=32(y), r2=45(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x), r6=194(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=391(x), r11=91(y), r12=78(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 122
LDI r1, 32
LDI r2, 45
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 194
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 391
LDI r11, 91
LDI r12, 78
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
