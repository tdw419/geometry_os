; DESCRIPTION: Draws a red rectangle at (215, 153) with width 112 and height 73.
; PLAN: r0=215(x), r1=153(y), r2=112(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 153
LDI r2, 112
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
