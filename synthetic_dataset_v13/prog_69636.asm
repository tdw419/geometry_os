; DESCRIPTION: Composite: Places a cyan circle of radius 62 at center (137, 84) then Creates a cyan rectangular region at (239, 109) spanning 83 by 12 pixels.
; PLAN: r0=137(x), r1=84(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=239(x), r6=109(y), r7=83(width), r8=12(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 137
LDI r1, 84
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 239
LDI r6, 109
LDI r7, 83
LDI r8, 12
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
