; DESCRIPTION: Composite: Places a orange circle of radius 62 at center (310, 79) then Renders a yellow box of size 84x17 starting at (46, 15).
; PLAN: r0=310(x), r1=79(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=15(y), r7=84(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 79
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 15
LDI r7, 84
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
