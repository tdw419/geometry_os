; DESCRIPTION: Composite: Places a white dot at position (160, 28) then Places a yellow 12x73 rectangle at position (438, 81).
; PLAN: r0=160(x), r1=28(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=81(y), r7=12(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 28
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 438
LDI r6, 81
LDI r7, 12
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
