; DESCRIPTION: Composite: Places a orange dot at position (508, 42) then Creates a black rectangular region at (420, 95) spanning 91 by 17 pixels then Renders a cyan disk with center (296, 111) and radius 76.
; PLAN: r0=508(x), r1=42(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=420(x), r6=95(y), r7=91(width), r8=17(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x), r11=111(y), r12=76(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 508
LDI r1, 42
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 420
LDI r6, 95
LDI r7, 91
LDI r8, 17
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 111
LDI r12, 76
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
