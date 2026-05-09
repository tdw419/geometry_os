; DESCRIPTION: Draws a cyan rectangle at (167, 159) with width 95 and height 68.
; PLAN: r0=167(x), r1=159(y), r2=95(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 159
LDI r2, 95
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
