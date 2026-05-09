; DESCRIPTION: Draws a red rectangle at (384, 4) with width 50 and height 18.
; PLAN: r0=384(x), r1=4(y), r2=50(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 4
LDI r2, 50
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
