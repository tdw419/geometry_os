; DESCRIPTION: Composite: Places a red dot at position (89, 206) then Renders a white box of size 18x78 starting at (316, 74).
; PLAN: r0=89(x), r1=206(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=74(y), r7=18(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 206
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 316
LDI r6, 74
LDI r7, 18
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
