; DESCRIPTION: Draws a cyan rectangle at (384, 12) with width 24 and height 50.
; PLAN: r0=384(x), r1=12(y), r2=24(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 12
LDI r2, 24
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
