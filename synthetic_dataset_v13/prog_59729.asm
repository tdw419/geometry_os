; DESCRIPTION: Composite: Sets a single black pixel at (12, 173) then Places a black 28x63 rectangle at position (48, 30).
; PLAN: r0=12(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=48(x), r6=30(y), r7=28(width), r8=63(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 12
LDI r1, 173
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 48
LDI r6, 30
LDI r7, 28
LDI r8, 63
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
