; DESCRIPTION: Composite: Places a red 30x49 rectangle at position (308, 105) then Places a white dot at position (456, 93).
; PLAN: r0=308(x), r1=105(y), r2=30(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=93(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 308
LDI r1, 105
LDI r2, 30
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 93
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
