; DESCRIPTION: Composite: Sets a single black pixel at (368, 53) then Renders a black box of size 40x66 starting at (183, 100).
; PLAN: r0=368(x), r1=53(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=183(x), r6=100(y), r7=40(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 368
LDI r1, 53
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 183
LDI r6, 100
LDI r7, 40
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
