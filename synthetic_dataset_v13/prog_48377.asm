; DESCRIPTION: Composite: Places a red 44x77 rectangle at position (262, 23) then Places a black circle of radius 31 at center (379, 176).
; PLAN: r0=262(x), r1=23(y), r2=44(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=176(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 262
LDI r1, 23
LDI r2, 44
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 176
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
