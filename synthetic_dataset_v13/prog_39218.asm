; DESCRIPTION: Composite: Places a cyan 116x43 rectangle at position (376, 65) then Draws a yellow circle centered at (373, 68) with radius 13.
; PLAN: r0=376(x), r1=65(y), r2=116(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=68(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 65
LDI r2, 116
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 68
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
