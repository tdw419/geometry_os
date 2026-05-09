; DESCRIPTION: Draws a red rectangle at (215, 28) with width 117 and height 113.
; PLAN: r0=215(x), r1=28(y), r2=117(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 28
LDI r2, 117
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
