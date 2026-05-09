; DESCRIPTION: Draws a cyan rectangle at (241, 156) with width 19 and height 82.
; PLAN: r0=241(x), r1=156(y), r2=19(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 156
LDI r2, 19
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
