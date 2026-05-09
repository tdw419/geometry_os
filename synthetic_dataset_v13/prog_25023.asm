; DESCRIPTION: Draws a cyan rectangle at (397, 7) with width 115 and height 28.
; PLAN: r0=397(x), r1=7(y), r2=115(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 7
LDI r2, 115
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
