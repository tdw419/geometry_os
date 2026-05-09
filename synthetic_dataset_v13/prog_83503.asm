; DESCRIPTION: Composite: Sets a single orange pixel at (5, 173) then Places a cyan 45x62 rectangle at position (446, 79).
; PLAN: r0=5(x), r1=173(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=446(x), r6=79(y), r7=45(width), r8=62(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 173
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 446
LDI r6, 79
LDI r7, 45
LDI r8, 62
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
