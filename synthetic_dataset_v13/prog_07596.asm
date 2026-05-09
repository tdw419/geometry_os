; DESCRIPTION: Draws a red rectangle at (73, 121) with width 21 and height 12.
; PLAN: r0=73(x), r1=121(y), r2=21(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 121
LDI r2, 21
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
