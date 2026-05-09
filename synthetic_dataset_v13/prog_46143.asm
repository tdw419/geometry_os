; DESCRIPTION: Composite: Sets a single orange pixel at (61, 8) then Renders a black box of size 114x105 starting at (154, 98).
; PLAN: r0=61(x), r1=8(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=154(x), r6=98(y), r7=114(width), r8=105(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 8
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 154
LDI r6, 98
LDI r7, 114
LDI r8, 105
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
