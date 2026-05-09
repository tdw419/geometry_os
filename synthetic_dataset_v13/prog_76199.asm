; DESCRIPTION: Composite: Places a white dot at position (134, 171) then Places a magenta 11x20 rectangle at position (153, 187).
; PLAN: r0=134(x), r1=171(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=153(x), r6=187(y), r7=11(width), r8=20(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 171
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 153
LDI r6, 187
LDI r7, 11
LDI r8, 20
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
