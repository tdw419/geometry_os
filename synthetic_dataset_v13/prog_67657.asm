; DESCRIPTION: Draws a cyan rectangle at (381, 126) with width 107 and height 56.
; PLAN: r0=381(x), r1=126(y), r2=107(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 126
LDI r2, 107
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
