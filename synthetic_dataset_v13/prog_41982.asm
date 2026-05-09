; DESCRIPTION: Composite: Draws a yellow rectangle at (367, 137) with width 116 and height 83 then Creates a cyan circular shape at (277, 113) with radius 45.
; PLAN: r0=367(x), r1=137(y), r2=116(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x), r6=113(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 367
LDI r1, 137
LDI r2, 116
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 113
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
