; DESCRIPTION: Composite: Renders a orange disk with center (76, 82) and radius 61 then Creates a cyan rectangular region at (222, 23) spanning 105 by 26 pixels.
; PLAN: r0=76(x), r1=82(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=222(x), r6=23(y), r7=105(width), r8=26(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 82
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 222
LDI r6, 23
LDI r7, 105
LDI r8, 26
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
