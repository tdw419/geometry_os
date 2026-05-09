; DESCRIPTION: Composite: Places a white dot at position (154, 41) then Renders a orange box of size 117x49 starting at (317, 118).
; PLAN: r0=154(x), r1=41(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=118(y), r7=117(width), r8=49(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 41
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 317
LDI r6, 118
LDI r7, 117
LDI r8, 49
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
