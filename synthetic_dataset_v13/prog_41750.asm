; DESCRIPTION: Draws a green rectangle at (231, 213) with width 64 and height 28.
; PLAN: r0=231(x), r1=213(y), r2=64(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 213
LDI r2, 64
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
