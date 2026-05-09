; DESCRIPTION: Draws a cyan rectangle at (37, 154) with width 26 and height 76.
; PLAN: r0=37(x), r1=154(y), r2=26(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 154
LDI r2, 26
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
