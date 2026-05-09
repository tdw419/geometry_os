; DESCRIPTION: Draws a red rectangle at (215, 119) with width 93 and height 18.
; PLAN: r0=215(x), r1=119(y), r2=93(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 119
LDI r2, 93
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
