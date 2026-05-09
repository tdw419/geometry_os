; DESCRIPTION: Draws a red rectangle at (141, 50) with width 14 and height 117.
; PLAN: r0=141(x), r1=50(y), r2=14(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 50
LDI r2, 14
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
