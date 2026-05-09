; DESCRIPTION: Composite: Places a cyan dot at position (384, 46) then Places a blue circle of radius 28 at center (82, 170) then Creates a orange rectangular region at (65, 127) spanning 13 by 20 pixels.
; PLAN: r0=384(x), r1=46(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=170(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=65(x), r11=127(y), r12=13(width), r13=20(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 46
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 82
LDI r6, 170
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 65
LDI r11, 127
LDI r12, 13
LDI r13, 20
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
