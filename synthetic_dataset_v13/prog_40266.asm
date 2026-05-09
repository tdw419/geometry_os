; DESCRIPTION: Composite: Sets a single blue pixel at (309, 116) then Renders a blue box of size 18x68 starting at (370, 16).
; PLAN: r0=309(x), r1=116(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=16(y), r7=18(width), r8=68(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 116
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 16
LDI r7, 18
LDI r8, 68
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
