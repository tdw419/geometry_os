; DESCRIPTION: Composite: Places a orange 120x74 rectangle at position (255, 121) then Sets a single black pixel at (26, 79).
; PLAN: r0=255(x), r1=121(y), r2=120(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=79(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 255
LDI r1, 121
LDI r2, 120
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 79
LDI r7, 0x000000
PSET r5, r6, r7
HALT
