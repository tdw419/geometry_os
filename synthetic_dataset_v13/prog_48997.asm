; DESCRIPTION: Composite: Places a cyan dot at position (444, 240) then Renders a black box of size 94x39 starting at (283, 102) then Draws a yellow circle centered at (71, 113) with radius 62.
; PLAN: r0=444(x), r1=240(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=102(y), r7=94(width), r8=39(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=71(x), r11=113(y), r12=62(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 444
LDI r1, 240
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 102
LDI r7, 94
LDI r8, 39
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 71
LDI r11, 113
LDI r12, 62
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
