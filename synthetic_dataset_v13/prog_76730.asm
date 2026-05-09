; DESCRIPTION: Draws a red rectangle at (44, 121) with width 117 and height 120.
; PLAN: r0=44(x), r1=121(y), r2=117(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 121
LDI r2, 117
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
