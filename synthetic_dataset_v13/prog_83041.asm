; DESCRIPTION: Draws a cyan rectangle at (64, 28) with width 62 and height 89.
; PLAN: r0=64(x), r1=28(y), r2=62(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 28
LDI r2, 62
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
