; DESCRIPTION: Draws a red rectangle at (80, 164) with width 20 and height 53.
; PLAN: r0=80(x), r1=164(y), r2=20(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 164
LDI r2, 20
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
