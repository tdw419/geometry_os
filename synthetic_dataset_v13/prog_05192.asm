; DESCRIPTION: Composite: Places a black dot at position (46, 78) then Places a yellow 87x73 rectangle at position (252, 170).
; PLAN: r0=46(x), r1=78(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=252(x), r6=170(y), r7=87(width), r8=73(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 46
LDI r1, 78
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 252
LDI r6, 170
LDI r7, 87
LDI r8, 73
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
