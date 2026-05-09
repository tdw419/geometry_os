; DESCRIPTION: Draws a black rectangle at (215, 153) with width 45 and height 93.
; PLAN: r0=215(x), r1=153(y), r2=45(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 153
LDI r2, 45
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
