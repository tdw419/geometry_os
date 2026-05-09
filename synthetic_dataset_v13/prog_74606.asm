; DESCRIPTION: Composite: Sets a single yellow pixel at (270, 222) then Renders a white box of size 41x16 starting at (189, 44).
; PLAN: r0=270(x), r1=222(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=44(y), r7=41(width), r8=16(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 222
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 189
LDI r6, 44
LDI r7, 41
LDI r8, 16
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
