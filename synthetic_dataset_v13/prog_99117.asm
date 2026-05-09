; DESCRIPTION: Draws a red rectangle at (393, 112) with width 119 and height 53.
; PLAN: r0=393(x), r1=112(y), r2=119(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 112
LDI r2, 119
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
