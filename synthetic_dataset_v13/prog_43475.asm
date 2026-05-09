; DESCRIPTION: Composite: Places a orange dot at position (477, 197) then Places a cyan line segment connecting (375, 95) to (308, 178).
; PLAN: r0=477(x), r1=197(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=375(x1), r6=95(y1), r7=308(x2), r8=178(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 477
LDI r1, 197
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 375
LDI r6, 95
LDI r7, 308
LDI r8, 178
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
