; DESCRIPTION: Draws a red rectangle at (237, 16) with width 43 and height 66.
; PLAN: r0=237(x), r1=16(y), r2=43(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 16
LDI r2, 43
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
