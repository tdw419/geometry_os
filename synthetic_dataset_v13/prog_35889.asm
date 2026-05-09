; DESCRIPTION: Draws a cyan rectangle at (93, 104) with width 42 and height 29.
; PLAN: r0=93(x), r1=104(y), r2=42(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 104
LDI r2, 42
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
