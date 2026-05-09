; DESCRIPTION: Composite: Places a white 83x106 rectangle at position (12, 50) then Places a red dot at position (434, 86).
; PLAN: r0=12(x), r1=50(y), r2=83(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=86(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 50
LDI r2, 83
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 86
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
