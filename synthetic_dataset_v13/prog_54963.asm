; DESCRIPTION: Composite: Places a green dot at position (108, 15) then Places a magenta circle of radius 59 at center (239, 170) then Renders a magenta box of size 119x110 starting at (122, 69).
; PLAN: r0=108(x), r1=15(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=170(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=122(x), r11=69(y), r12=119(width), r13=110(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 108
LDI r1, 15
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 239
LDI r6, 170
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 122
LDI r11, 69
LDI r12, 119
LDI r13, 110
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
