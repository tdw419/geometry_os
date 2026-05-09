; DESCRIPTION: Composite: Renders a white box of size 59x16 starting at (316, 198) then Creates a cyan circular shape at (326, 186) with radius 49.
; PLAN: r0=316(x), r1=198(y), r2=59(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=186(y), r7=49(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 316
LDI r1, 198
LDI r2, 59
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 186
LDI r7, 49
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
