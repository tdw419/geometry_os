; DESCRIPTION: Draws a black rectangle at (89, 126) with width 86 and height 64.
; PLAN: r0=89(x), r1=126(y), r2=86(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 126
LDI r2, 86
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
