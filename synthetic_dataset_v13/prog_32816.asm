; DESCRIPTION: Composite: Places a white dot at position (421, 9) then Places a blue 117x102 rectangle at position (268, 153).
; PLAN: r0=421(x), r1=9(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=268(x), r6=153(y), r7=117(width), r8=102(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 9
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 268
LDI r6, 153
LDI r7, 117
LDI r8, 102
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
