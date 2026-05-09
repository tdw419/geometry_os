; DESCRIPTION: Draws a cyan rectangle at (67, 159) with width 98 and height 39.
; PLAN: r0=67(x), r1=159(y), r2=98(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 159
LDI r2, 98
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
