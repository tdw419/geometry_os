; DESCRIPTION: Composite: Draws a white circle centered at (328, 109) with radius 71 then Places a green 62x97 rectangle at position (335, 62).
; PLAN: r0=328(x), r1=109(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=62(y), r7=62(width), r8=97(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 109
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 62
LDI r7, 62
LDI r8, 97
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
