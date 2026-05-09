; DESCRIPTION: Draws a cyan rectangle at (299, 96) with width 108 and height 47.
; PLAN: r0=299(x), r1=96(y), r2=108(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 96
LDI r2, 108
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
