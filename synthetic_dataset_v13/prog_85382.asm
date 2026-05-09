; DESCRIPTION: Draws a red rectangle at (254, 38) with width 66 and height 93.
; PLAN: r0=254(x), r1=38(y), r2=66(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 38
LDI r2, 66
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
