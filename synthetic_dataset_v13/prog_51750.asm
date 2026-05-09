; DESCRIPTION: Composite: Creates a red circular shape at (119, 230) with radius 23 then Places a yellow 17x28 rectangle at position (380, 49).
; PLAN: r0=119(x), r1=230(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=49(y), r7=17(width), r8=28(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 230
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 49
LDI r7, 17
LDI r8, 28
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
