; DESCRIPTION: Composite: Creates a blue circular shape at (347, 112) with radius 72 then Places a white 93x76 rectangle at position (273, 1).
; PLAN: r0=347(x), r1=112(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=1(y), r7=93(width), r8=76(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 112
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 1
LDI r7, 93
LDI r8, 76
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
