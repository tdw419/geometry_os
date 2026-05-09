; DESCRIPTION: Composite: Places a black 91x98 rectangle at position (356, 18) then Places a white circle of radius 56 at center (210, 130).
; PLAN: r0=356(x), r1=18(y), r2=91(width), r3=98(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x), r6=130(y), r7=56(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 18
LDI r2, 91
LDI r3, 98
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 130
LDI r7, 56
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
