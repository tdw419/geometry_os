; DESCRIPTION: Composite: Places a black dot at position (344, 236) then Places a cyan 103x50 rectangle at position (374, 90).
; PLAN: r0=344(x), r1=236(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=374(x), r6=90(y), r7=103(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 236
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 374
LDI r6, 90
LDI r7, 103
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
