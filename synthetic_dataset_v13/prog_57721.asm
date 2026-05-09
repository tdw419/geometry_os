; DESCRIPTION: Draws a black rectangle at (215, 47) with width 72 and height 74.
; PLAN: r0=215(x), r1=47(y), r2=72(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 47
LDI r2, 72
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
