; DESCRIPTION: Composite: Sets a single black pixel at (341, 4) then Places a green 38x103 rectangle at position (408, 128).
; PLAN: r0=341(x), r1=4(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=128(y), r7=38(width), r8=103(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 4
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 408
LDI r6, 128
LDI r7, 38
LDI r8, 103
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
