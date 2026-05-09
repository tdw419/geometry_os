; DESCRIPTION: Composite: Sets a single orange pixel at (60, 143) then Draws a cyan rectangle at (16, 168) with width 90 and height 82.
; PLAN: r0=60(x), r1=143(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=16(x), r6=168(y), r7=90(width), r8=82(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 143
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 16
LDI r6, 168
LDI r7, 90
LDI r8, 82
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
