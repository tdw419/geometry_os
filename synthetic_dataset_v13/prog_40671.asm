; DESCRIPTION: Composite: Sets a single black pixel at (464, 150) then Places a black 11x52 rectangle at position (284, 118).
; PLAN: r0=464(x), r1=150(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=284(x), r6=118(y), r7=11(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 150
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 284
LDI r6, 118
LDI r7, 11
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
