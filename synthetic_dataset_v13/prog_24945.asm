; DESCRIPTION: Draws a red rectangle at (129, 180) with width 70 and height 28.
; PLAN: r0=129(x), r1=180(y), r2=70(width), r3=28(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 180
LDI r2, 70
LDI r3, 28
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
