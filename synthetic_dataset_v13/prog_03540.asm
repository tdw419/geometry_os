; DESCRIPTION: Composite: Sets a single white pixel at (504, 29) then Places a green 28x18 rectangle at position (278, 206).
; PLAN: r0=504(x), r1=29(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=206(y), r7=28(width), r8=18(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 504
LDI r1, 29
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 206
LDI r7, 28
LDI r8, 18
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
