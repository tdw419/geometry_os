; DESCRIPTION: Draws a cyan rectangle at (116, 195) with width 68 and height 11.
; PLAN: r0=116(x), r1=195(y), r2=68(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 195
LDI r2, 68
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
