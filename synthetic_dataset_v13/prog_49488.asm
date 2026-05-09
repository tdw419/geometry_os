; DESCRIPTION: Composite: Places a white 66x101 rectangle at position (169, 14) then Sets a single cyan pixel at (379, 41).
; PLAN: r0=169(x), r1=14(y), r2=66(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=41(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 169
LDI r1, 14
LDI r2, 66
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 41
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
