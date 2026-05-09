; DESCRIPTION: Composite: Places a cyan dot at position (230, 95) then Places a orange 63x72 rectangle at position (129, 37).
; PLAN: r0=230(x), r1=95(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=37(y), r7=63(width), r8=72(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 230
LDI r1, 95
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 129
LDI r6, 37
LDI r7, 63
LDI r8, 72
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
