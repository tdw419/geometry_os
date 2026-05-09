; DESCRIPTION: Composite: Draws a cyan rectangle at (4, 107) with width 20 and height 116 then Places a magenta dot at position (16, 82).
; PLAN: r0=4(x), r1=107(y), r2=20(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x), r6=82(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 4
LDI r1, 107
LDI r2, 20
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 82
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
