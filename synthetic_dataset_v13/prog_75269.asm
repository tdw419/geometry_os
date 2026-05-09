; DESCRIPTION: Draws a cyan rectangle at (64, 102) with width 113 and height 107.
; PLAN: r0=64(x), r1=102(y), r2=113(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 102
LDI r2, 113
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
