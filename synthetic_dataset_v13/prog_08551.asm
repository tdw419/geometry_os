; DESCRIPTION: Draws a cyan rectangle at (384, 4) with width 85 and height 47.
; PLAN: r0=384(x), r1=4(y), r2=85(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 4
LDI r2, 85
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
