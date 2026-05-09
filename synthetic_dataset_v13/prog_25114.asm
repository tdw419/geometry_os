; DESCRIPTION: Composite: Places a yellow 76x119 rectangle at position (12, 124) then Places a green circle of radius 23 at center (67, 140).
; PLAN: r0=12(x), r1=124(y), r2=76(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=140(y), r7=23(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 12
LDI r1, 124
LDI r2, 76
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 140
LDI r7, 23
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
