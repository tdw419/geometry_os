; DESCRIPTION: Composite: Places a yellow circle of radius 39 at center (245, 187) then Renders a yellow box of size 90x91 starting at (397, 17) then Sets a single black pixel at (451, 228).
; PLAN: r0=245(x), r1=187(y), r2=39(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=17(y), r7=90(width), r8=91(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x), r11=228(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 187
LDI r2, 39
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 17
LDI r7, 90
LDI r8, 91
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 228
LDI r12, 0x000000
PSET r10, r11, r12
HALT
