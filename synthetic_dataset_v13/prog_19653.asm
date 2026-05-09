; DESCRIPTION: Composite: Draws a cyan rectangle at (85, 85) with width 32 and height 42 then Places a orange dot at position (128, 169).
; PLAN: r0=85(x), r1=85(y), r2=32(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=169(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 85
LDI r1, 85
LDI r2, 32
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 169
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
