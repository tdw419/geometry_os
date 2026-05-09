; DESCRIPTION: Draws a red rectangle at (455, 126) with width 29 and height 64.
; PLAN: r0=455(x), r1=126(y), r2=29(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 126
LDI r2, 29
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
