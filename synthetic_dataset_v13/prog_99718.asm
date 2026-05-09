; DESCRIPTION: Composite: Places a white 104x118 rectangle at position (270, 116) then Places a black dot at position (280, 248).
; PLAN: r0=270(x), r1=116(y), r2=104(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=248(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 270
LDI r1, 116
LDI r2, 104
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 248
LDI r7, 0x000000
PSET r5, r6, r7
HALT
