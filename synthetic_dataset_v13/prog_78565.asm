; DESCRIPTION: Draws a cyan rectangle at (93, 32) with width 104 and height 29.
; PLAN: r0=93(x), r1=32(y), r2=104(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 32
LDI r2, 104
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
