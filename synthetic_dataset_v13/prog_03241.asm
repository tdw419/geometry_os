; DESCRIPTION: Composite: Sets a single red pixel at (39, 166) then Places a cyan 52x69 rectangle at position (418, 129).
; PLAN: r0=39(x), r1=166(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=129(y), r7=52(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 166
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 418
LDI r6, 129
LDI r7, 52
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
