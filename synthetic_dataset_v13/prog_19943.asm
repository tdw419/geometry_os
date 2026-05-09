; DESCRIPTION: Composite: Places a magenta 28x74 rectangle at position (425, 41) then Places a cyan dot at position (331, 74).
; PLAN: r0=425(x), r1=41(y), r2=28(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=74(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 425
LDI r1, 41
LDI r2, 28
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 74
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
