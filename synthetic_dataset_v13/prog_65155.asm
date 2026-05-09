; DESCRIPTION: Draws a cyan rectangle at (287, 178) with width 95 and height 47.
; PLAN: r0=287(x), r1=178(y), r2=95(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 178
LDI r2, 95
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
