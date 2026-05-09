; DESCRIPTION: Composite: Places a red dot at position (327, 126) then Renders a red box of size 17x73 starting at (12, 183).
; PLAN: r0=327(x), r1=126(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=12(x), r6=183(y), r7=17(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 126
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 12
LDI r6, 183
LDI r7, 17
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
