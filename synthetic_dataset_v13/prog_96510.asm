; DESCRIPTION: Draws a red rectangle at (210, 70) with width 10 and height 73.
; PLAN: r0=210(x), r1=70(y), r2=10(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 70
LDI r2, 10
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
