; DESCRIPTION: Draws a cyan rectangle at (64, 81) with width 102 and height 64.
; PLAN: r0=64(x), r1=81(y), r2=102(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 81
LDI r2, 102
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
