; DESCRIPTION: Draws a cyan rectangle at (139, 126) with width 68 and height 108.
; PLAN: r0=139(x), r1=126(y), r2=68(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 126
LDI r2, 68
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
