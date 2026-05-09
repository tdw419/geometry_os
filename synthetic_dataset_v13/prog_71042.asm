; DESCRIPTION: Composite: Sets a single white pixel at (181, 13) then Creates a orange rectangular region at (450, 39) spanning 11 by 24 pixels then Renders a yellow disk with center (272, 111) and radius 15.
; PLAN: r0=181(x), r1=13(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=450(x), r6=39(y), r7=11(width), r8=24(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=272(x), r11=111(y), r12=15(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 181
LDI r1, 13
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 450
LDI r6, 39
LDI r7, 11
LDI r8, 24
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 272
LDI r11, 111
LDI r12, 15
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
