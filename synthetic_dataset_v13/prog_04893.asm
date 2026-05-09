; DESCRIPTION: Composite: Draws a cyan rectangle at (460, 36) with width 30 and height 103 then Places a magenta dot at position (192, 180).
; PLAN: r0=460(x), r1=36(y), r2=30(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=192(x), r6=180(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 460
LDI r1, 36
LDI r2, 30
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 180
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
