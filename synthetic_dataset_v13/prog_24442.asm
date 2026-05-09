; DESCRIPTION: Draws a cyan rectangle at (384, 17) with width 38 and height 107.
; PLAN: r0=384(x), r1=17(y), r2=38(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 17
LDI r2, 38
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
