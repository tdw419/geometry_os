; DESCRIPTION: Draws a black rectangle at (215, 7) with width 65 and height 37.
; PLAN: r0=215(x), r1=7(y), r2=65(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 7
LDI r2, 65
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
