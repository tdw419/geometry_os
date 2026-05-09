; DESCRIPTION: Composite: Places a red dot at position (375, 130) then Places a white 78x91 rectangle at position (138, 149).
; PLAN: r0=375(x), r1=130(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=149(y), r7=78(width), r8=91(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 130
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 138
LDI r6, 149
LDI r7, 78
LDI r8, 91
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
