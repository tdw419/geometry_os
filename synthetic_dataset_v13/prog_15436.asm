; DESCRIPTION: Draws a red rectangle at (215, 22) with width 21 and height 39.
; PLAN: r0=215(x), r1=22(y), r2=21(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 22
LDI r2, 21
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
