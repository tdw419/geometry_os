; DESCRIPTION: Composite: Creates a green circular shape at (419, 96) with radius 77 then Places a white 79x12 rectangle at position (6, 124).
; PLAN: r0=419(x), r1=96(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=6(x), r6=124(y), r7=79(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 96
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 6
LDI r6, 124
LDI r7, 79
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
