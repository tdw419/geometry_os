; DESCRIPTION: Draws a cyan rectangle at (21, 78) with width 93 and height 62.
; PLAN: r0=21(x), r1=78(y), r2=93(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 78
LDI r2, 93
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
