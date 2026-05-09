; DESCRIPTION: Composite: Sets a single blue pixel at (443, 53) then Places a white 41x79 rectangle at position (407, 38).
; PLAN: r0=443(x), r1=53(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=38(y), r7=41(width), r8=79(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 53
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 38
LDI r7, 41
LDI r8, 79
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
