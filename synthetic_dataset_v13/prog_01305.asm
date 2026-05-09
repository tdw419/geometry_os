; DESCRIPTION: Draws a red rectangle at (126, 31) with width 19 and height 16.
; PLAN: r0=126(x), r1=31(y), r2=19(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 31
LDI r2, 19
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
