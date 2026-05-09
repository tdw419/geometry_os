; DESCRIPTION: Composite: Places a white dot at position (432, 13) then Places a yellow 15x83 rectangle at position (394, 15).
; PLAN: r0=432(x), r1=13(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=394(x), r6=15(y), r7=15(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 13
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 15
LDI r7, 15
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
