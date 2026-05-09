; DESCRIPTION: Composite: Places a cyan 55x104 rectangle at position (297, 108) then Creates a green circular shape at (212, 178) with radius 41.
; PLAN: r0=297(x), r1=108(y), r2=55(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x), r6=178(y), r7=41(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 297
LDI r1, 108
LDI r2, 55
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 178
LDI r7, 41
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
