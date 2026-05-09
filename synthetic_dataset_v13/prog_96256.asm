; DESCRIPTION: Draws a red rectangle at (60, 112) with width 76 and height 84.
; PLAN: r0=60(x), r1=112(y), r2=76(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 112
LDI r2, 76
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
